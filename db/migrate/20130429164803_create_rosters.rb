class CreateRosters < ActiveRecord::Migration
  def change
    create_table :rosters do |t|
      t.integer :cop_id
      t.integer :department_id
      t.string :status

      t.timestamps
    end
  end
end
