class SessionsController < ApplicationController
  require 'uri'
  require 'net/http'

  def create
    auth = request.env["omniauth.auth"]
    users = User.where(uid: auth[:uid])
    if users.blank?
      user = User.create(name: auth[:info][:name], email: auth[:info][:email], trello_oauth_token: auth[:credentials][:token], trello_secret: auth[:credentials][:secret], uid: auth[:uid])
    else
      user = users.first
    end
    session[:user_id] = user.id
    if user.present?
      Adapter::TrelloWrapper.configure_client(user)
      board_id = "Suydpc3l"
      board_info = Adapter::TrelloWrapper.get_board_info(board_id)
      if TrelloBoard.where(trello_short_id: board_info.attributes[:id]).blank?
        board = TrelloBoard.new(name: "jobs", trello_short_id: board_info.attributes[:id])
        board.save
        redirect_to new_job_path
      else
        redirect_to root_path
      end
    else
      redirect_to root_path
    end   
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => "Logged out!"
  end

end
#Trello::List.create(name: "seniuour backen", board_id: "5bffab5b1cdb5039fc70e09b")
#Trello::Card.create(name: "anand kr", desc: "sdfjdbnfjkdsnbjksdbn", list_id: "5bffbda4ce0f510fdd8aafc7")
#5bff96246086de2ab98cc25f