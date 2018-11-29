class CreateJobs < ActiveRecord::Migration[5.1]
  def change
    create_table :jobs do |t|
      t.string :title
      t.string :description
      t.date :closing_date
      t.string :board_id

      t.timestamps
    end
  end
end
