class CreateBabysittingTimeslots < ActiveRecord::Migration
  def change
    create_table :babysitting_timeslots do |t|
      t.time :time_slot
      t.timestamps
    end
  end
end
