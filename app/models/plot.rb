# == Schema Information
#
# Table name: plots
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  color      :string(255)
#  story_id   :integer
#  page_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

class Plot < ActiveRecord::Base
  
  belongs_to :story 
  belongs_to :page
  
  validates :name, :presence => true
  
end
