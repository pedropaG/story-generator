# == Schema Information
#
# Table name: stories
#
#  id         :integer          not null, primary key
#  title      :string(255)      not null
#  user_id    :integer          not null
#  status     :integer          default(0), not null
#  readed     :integer          default(0), not null
#  score      :float
#  created_at :datetime
#  updated_at :datetime
#

class Story < ActiveRecord::Base
  
  belongs_to :user
  has_many :pages, :inverse_of => :story
  has_many :plots, :inverse_of => :story
    
  
  
end
