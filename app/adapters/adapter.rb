require 'trello'
module Adapter
  class TrelloWrapper
    
    CALLBACK_URL = "http://localhost:3000/webhooks/recieve"

    def self.configure_client(current_user)
      Trello.configure do |config|
        config.consumer_key = "7c5120fa7dff62773d68f270e3c97d15"
        config.consumer_secret = "8bf8ad4ed81a0591091334be9840f1b2c09f3724204bc1447f1d59e1484dc080"
        config.oauth_token = current_user.trello_oauth_token
        config.oauth_token_secret = current_user.trello_secret
      end
    end

    def self.get_board_info(short_id)
      Trello::Board.find(short_id)
    end

    def self.create_webhook(trello_board_id)
      HTTParty.post("https://api.trello.com/1/tokens/
        #{Trello.client.trello_oauth_token}/webhooks/?key=7c5120fa7dff62773d68f270e3c97d15",
        :query => { description: "test", callbackURL: 
        CALLBACK_URL, idModel: trello_board_id },
        :headers => { "Content-Type" => "application/x-www-
        form-urlencoded"})
    end       
  end
end 