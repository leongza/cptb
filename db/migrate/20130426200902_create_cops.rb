class CreateCops < ActiveRecord::Migration
  def self.up
    create_table :cops do |t|
      t.string :lastname
      t.string :firstname
      t.string :address
      t.string :city
      t.string :state
      t.string :zip
      t.string :badge
      t.timestamps
    end
  end

  def self.down
    drop_table :cops
  end
end
