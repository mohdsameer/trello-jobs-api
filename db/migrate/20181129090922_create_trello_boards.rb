class CreateTrelloBoards < ActiveRecord::Migration[5.1]
  def change
    create_table :trello_boards do |t|
      t.string :name
      t.string :trello_short_id

      t.timestamps
    end
  end
end
