class Plot < ActiveRecord::Base
  
  belongs_to :story 
  belongs_to :page
  
  validates :name, :presence => true
  
end
