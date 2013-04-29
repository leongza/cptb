class Department < ActiveRecord::Base
  attr_accessible :name, :city, :state, :logo
  has_attached_file :logo, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  has_and_belongs_to_many :cops
end
