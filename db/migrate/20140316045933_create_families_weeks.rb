class CreateFamiliesWeeks < ActiveRecord::Migration
  def change
    create_table :families_weeks do |t|
      t.integer :family_id
      t.integer :week_id
      t.timestamps
    end
  end
end
