class AddOwnerToSpots < ActiveRecord::Migration
  def change
    add_column :spots, :owner, :string
  end
end
