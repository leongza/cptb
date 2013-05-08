class AddSexRaceToCop < ActiveRecord::Migration
  def change
    add_column :cops, :sex, :string
    add_column :cops, :race, :string
  end
end
