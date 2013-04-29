class CreateEvidences < ActiveRecord::Migration
  def change
    create_table :evidences do |t|
      t.string :title
      t.string :url

      t.timestamps
    end
  end
end
