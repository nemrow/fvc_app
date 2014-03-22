class CreateBabysittings < ActiveRecord::Migration
  def change
    create_table :babysittings do |t|
      t.integer :family_id
      t.string :status
      t.datetime :begin_date
      t.datetime :end_date
      t.integer :staff_id
      t.timestamps
    end
  end
end
