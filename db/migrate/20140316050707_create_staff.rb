class CreateStaff < ActiveRecord::Migration
  def change
    create_table :staff do |t|
      t.string :name
      t.integer :login_code
      t.timestamps
    end
  end
end
