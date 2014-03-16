class CreateEventInstances < ActiveRecord::Migration
  def change
    create_table :event_instances do |t|
      t.integer :event_id
      t.integer :week_id
      t.date :date
      t.timestamps
    end
  end
end
