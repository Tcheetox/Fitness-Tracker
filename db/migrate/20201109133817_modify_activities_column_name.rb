class ModifyActivitiesColumnName < ActiveRecord::Migration[6.0]
  def change
    add_column :activities, :user_id, :integer
    remove_column :activities, :user
  end
end
