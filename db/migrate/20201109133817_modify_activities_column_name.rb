class ModifyActivitiesColumnName < ActiveRecord::Migration[6.0]
  def change
    add_column :activities, :user_id, :bigint
    remove_column :activities, :user
  end
end
