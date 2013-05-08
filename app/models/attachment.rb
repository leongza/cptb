class Attachment < ActiveRecord::Base
  belongs_to :cop
  has_attached_file :attachment, :styles => { :medium => "300x300>", :thumb => "100x100", :small => "32x32" }, :default_url => "missingportraitx:style.jpg"
  attr_accessible :attachment, :verified, :priority, :attachment_content_type, :attachment_file_name, :attachment_file_size, :attachment_updated_at, :cop_id
end
