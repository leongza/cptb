class Cop < ActiveRecord::Base
  attr_accessible :lastname, :firstname, :sex, :race, :rank, :address, :city, :state, :zip, :badge, :helmet, :attachments_attributes, :departments_attributes, :evidences_attributes, :department_ids, :evidence_ids
  has_many :attachments
  has_many :evidences
  has_many :rosters, :dependent => :destroy
  has_many :departments, :through => :rosters
  accepts_nested_attributes_for :attachments, :allow_destroy => true
  accepts_nested_attributes_for :evidences, :reject_if => :all_blank?
  accepts_nested_attributes_for :departments, :allow_destroy => true
  paginates_per 50

  def attachments_array=(array)
    array.each do |file|
      attachments.build(:attachment => file)
    end
  end

  def self.search(search)
    if search
      where('lastname LIKE ? OR firstname LIKE ? OR badge LIKE ?', "%#{search}%", "%#{search}%", "%#{search}%")
    else
      scoped
    end
  end
  def portrait
    @p = self.attachments.where(:verified=>true).first || self.attachments.build
    return @p
  end
  def department
    return departments.first
  end
end
