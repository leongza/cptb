class Roster < ActiveRecord::Base
  #attr_accessible :cop_id, :department_id, :status
  belongs_to :cop
  belongs_to :department
end
