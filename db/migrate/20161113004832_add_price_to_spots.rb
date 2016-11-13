class AddPriceToSpots < ActiveRecord::Migration
  def change
    add_column :spots, :price, :number
  end
end
