class AddRankToCop < ActiveRecord::Migration
  def change
    add_column :cops, :rank, :string
  end
end
