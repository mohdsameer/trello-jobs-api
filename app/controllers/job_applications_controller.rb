class JobApplicationsController < ApplicationController
  before_action :authenticate_user	
  def new
  	@application = JobApplication.new
  end

  def create
  	appliation = JobApplication.new(job_params)
  	if appliation.save
  	   card = Trello::Card.create(name: appliation.name, desc: appliation.coverletter, list_id: params[:job_application][:list_id])
  	   card.attributes[:member_ids] << Trello::Member.find(current_user.username).id
       card.save
       flash[:success] = "Applied successfully"
  	else
  		flash[:error] = "Something went wrong!"
  	end
  	redirect_to jobs_path	 	
  end

private
  def job_params
  	params.require(:job_application).permit(:name, :email, :address, :coverletter, :job_id)
  end

  def authenticate_user
  	unless current_user.present?
  		redirect_to root_path
  		flash[:error] = "Login first"
  	end
  end    
end
