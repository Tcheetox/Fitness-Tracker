class AddColumnActivity < ActiveRecord::Migration[6.0]
  def change
    add_column :activities, :rating, :integer
  end
end
