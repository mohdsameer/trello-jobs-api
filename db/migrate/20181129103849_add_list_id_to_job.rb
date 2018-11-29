class AddListIdToJob < ActiveRecord::Migration[5.1]
  def change
    add_column :jobs, :list_id, :string
  end
end
