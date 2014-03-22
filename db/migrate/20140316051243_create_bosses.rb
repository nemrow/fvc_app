class CreateBosses < ActiveRecord::Migration
  def change
    create_table :bosses do |t|
      t.string :name
      t.string :password_digest
      t.timestamps
    end
  end
end
