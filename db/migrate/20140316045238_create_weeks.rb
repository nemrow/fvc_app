class CreateWeeks < ActiveRecord::Migration
  def change
    create_table :weeks do |t|
      t.integer :week_num
      t.date :begin_date
      t.date :end_date
      t.timestamps
    end
  end
end
