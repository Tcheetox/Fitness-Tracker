class CreateActivities < ActiveRecord::Migration[5.1]
  def change
    create_table :activities do |t|
      t.string :name
      t.datetime :date
      t.timestamp :duration

      t.timestamps
    end
  end
end
