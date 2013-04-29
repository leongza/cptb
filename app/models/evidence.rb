class Evidence < ActiveRecord::Base
  belongs_to :cop
  attr_accessible :title, :url
  validates :url, :presence => true
  before_save :set_title
  def set_title
    doc = Nokogiri::HTML(open(url))
    self.title = doc.title
  end
end
