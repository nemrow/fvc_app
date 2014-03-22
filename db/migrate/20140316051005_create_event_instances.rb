class CreateEventInstances < ActiveRecord::Migration
  def change
    create_table :event_instances do |t|
      t.integer :event_id
      t.integer :week_id
      t.datetime :min_date
      t.datetime :max_date
      t.timestamps
    end
  end
end
