class AddPriorityVerifiedToAttachments < ActiveRecord::Migration
  def change
    add_column :attachments, :priority, :integer, :default => nil
    add_column :attachments, :verified, :boolean, :default => false
  end
end
