class AddColumnActivityDistance < ActiveRecord::Migration[6.0]
  def change
    add_column :activities, :distance, :float
  end
end
