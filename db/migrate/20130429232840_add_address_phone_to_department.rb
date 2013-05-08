class AddAddressPhoneToDepartment < ActiveRecord::Migration
  def change
    add_column :departments, :address, :string
    add_column :departments, :phone, :string
    add_column :departments, :postalcode, :string
  end
end
