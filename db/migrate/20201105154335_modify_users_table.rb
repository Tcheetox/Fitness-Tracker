class ModifyUsersTable < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :first_name, :string, null: true, default: ''
    add_column :users, :last_name, :string, null: true, default: ''
    add_column :users, :country, :string, null: true, default: ''
    add_column :users, :phone, :string, null: true, default: ''
    add_column :users, :gender, :integer, null: true
  end
end
