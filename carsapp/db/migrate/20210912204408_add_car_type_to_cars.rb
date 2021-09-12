class AddCarTypeToCars < ActiveRecord::Migration[6.1]
  def change
    add_column :cars, :carType, :string
  end
end
