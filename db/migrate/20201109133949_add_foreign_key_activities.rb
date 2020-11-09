class AddForeignKeyActivities < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :activities, :users
  end
end
