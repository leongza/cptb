class AddHelmetToCop < ActiveRecord::Migration
  def change
    add_column :cops, :helmet, :string
  end
end
