class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :trello_oauth_token
      t.string :trello_secret
      t.string :name
      t.string :email

      t.timestamps
    end
  end
end
