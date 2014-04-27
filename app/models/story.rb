class Story < ActiveRecord::Base
  
  belongs_to :user
  has_many :pages, :inverse_of => :story
  has_many :plots, :inverse_of => :story
    
  
  
end
