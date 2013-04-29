class AddCopIdToEvidence < ActiveRecord::Migration
  def change
    add_column :evidences, :cop_id, :integer
  end
end
