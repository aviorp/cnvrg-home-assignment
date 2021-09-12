class CreateDriverCars < ActiveRecord::Migration[6.1]
  def change
    create_table :driver_cars do |t|
      t.references :driver, null: false, foreign_key: true
      t.references :car, null: false, foreign_key: true

      t.timestamps
    end
  end
end
