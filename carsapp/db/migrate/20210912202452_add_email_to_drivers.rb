class AddEmailToDrivers < ActiveRecord::Migration[6.1]
  def change
    add_column :drivers, :email, :string
  end
end
