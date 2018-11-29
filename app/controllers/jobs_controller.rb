class JobsController < ApplicationController
  before_action :authenticate_user

  def index
  	@jobs = Job.all
  end

  def new
  	@job = Job.new
  end

  def create
    job = Job.new(
    	title: params[:job][:title],
    	description: params[:job][:description],
    	board_id: TrelloBoard.last.trello_short_id
    	)
    if job.save
        list = Trello::List.create(name: job.title, board_id: job.board_id)
        job.update(list_id: list.attributes[:id])
        flash[:success] = "Job created successfully!"
    else
    	flash[:error] = "Something went wrong"
    end
    redirect_to jobs_path
  end

private
  def authenticate_user
  	unless current_user.present?
  		redirect_to root_path
  		flash[:error] = "Login first"
  	end
  end
end
