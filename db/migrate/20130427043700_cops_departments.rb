class CopsDepartments < ActiveRecord::Migration
  def up
    create_table :cops_departments, :id => false do |t|
      t.references :cop, :null => false
      t.references :department, :null => false
    end

# Adding the index can massively speed up join tables. Don't use the
# unique if you allow duplicates.
    add_index(:cops_departments, [:cop_id, :department_id], :unique => true)
  end

  def down
  end
end
