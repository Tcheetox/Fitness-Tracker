class ModifyActivities < ActiveRecord::Migration[6.0]
  def change
    add_column :activities, :type, :integer
    add_column :activities, :user, :integer
    remove_column :activities, :name
    change_column :activities, :duration, :integer
  end
end
