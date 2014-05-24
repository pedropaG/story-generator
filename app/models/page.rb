# == Schema Information
#
# Table name: pages
#
#  id         :integer          not null, primary key
#  story_id   :integer
#  text       :text
#  title      :string(255)
#  position   :integer
#  posx       :integer
#  posy       :integer
#  posz       :integer
#  readed     :integer          default(0)
#  ending     :boolean          default(FALSE)
#  created_at :datetime
#  updated_at :datetime
#

class Page < ActiveRecord::Base
  
  belongs_to :story, :inverse_of => :pages
  has_one :plot, :inverse_of => :page
  has_many :choices
  
end
