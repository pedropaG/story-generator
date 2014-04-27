class Page < ActiveRecord::Base
  
  belongs_to :story, :inverse_of => :pages
  has_one :plot, :inverse_of => :page
  
end
