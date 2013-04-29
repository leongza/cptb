class Cop < ActiveRecord::Base
  attr_accessible :lastname, :firstname, :rank, :address, :city, :state, :zip, :badge, :attachments_attributes, :departments_attributes, :evidences_attributes, :department_ids, :evidence_ids
  has_many :attachments
  has_many :evidences
  has_and_belongs_to_many :departments
  accepts_nested_attributes_for :attachments, :allow_destroy => true
  accepts_nested_attributes_for :evidences, :reject_if => :all_blank
  accepts_nested_attributes_for :departments, :allow_destroy => true

  def attachments_array=(array)
    array.each do |file|
      attachments.build(:attachment => file)
    end
  end
end
