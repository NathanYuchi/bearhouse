class CreateSpots < ActiveRecord::Migration
  def change
    create_table :spots do |t|
      t.string :address
      t.integer :beds
      t.integer :baths
      t.string :description

      t.timestamps null: false
    end
  end
end
