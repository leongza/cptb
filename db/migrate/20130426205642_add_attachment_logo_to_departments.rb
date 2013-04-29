class AddAttachmentLogoToDepartments < ActiveRecord::Migration
  def self.up
    change_table :departments do |t|
      t.attachment :logo
    end
  end

  def self.down
    drop_attached_file :departments, :logo
  end
end
