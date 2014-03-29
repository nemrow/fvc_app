class CreateBabysittings < ActiveRecord::Migration
  def change
    create_table :babysittings do |t|
      t.integer :family_id
      t.integer :week_id
      t.string :status, :null => false, :default => 'pending'
      t.datetime :min_date
      t.datetime :max_date
      t.integer :staff_id
      t.timestamps
    end
  end
end
