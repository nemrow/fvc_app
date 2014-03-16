class CreateFamilies < ActiveRecord::Migration
  def change
    create_table :families do |t|
      t.string :last_name
      t.integer :login_code
      t.integer :room_num
      t.timestamps
    end
  end
end
