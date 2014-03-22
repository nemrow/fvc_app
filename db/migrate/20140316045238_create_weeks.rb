class CreateWeeks < ActiveRecord::Migration
  def change
    create_table :weeks do |t|
      t.integer :week_num
      t.datetime :min_date
      t.datetime :max_date
      t.timestamps
    end
  end
end
