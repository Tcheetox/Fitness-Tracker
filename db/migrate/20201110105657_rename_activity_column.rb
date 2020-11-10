class RenameActivityColumn < ActiveRecord::Migration[6.0]
  def change
    remove_column :activities, :type
    add_column :activities, :name, :integer
  end
end
