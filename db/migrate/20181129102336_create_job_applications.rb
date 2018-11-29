class CreateJobApplications < ActiveRecord::Migration[5.1]
  def change
    create_table :job_applications do |t|
      t.string :name
      t.string :email
      t.string :address
      t.text :coverletter
      t.references :job, foreign_key: true

      t.timestamps
    end
  end
end
