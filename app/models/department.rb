class Department < ActiveRecord::Base
  attr_accessible :name, :address, :city, :state, :postalcode, :phone, :logo
  has_attached_file :logo, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  has_many :rosters
  has_many :cops, :through => :rosters

end
