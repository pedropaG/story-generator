# == Schema Information
#
# Table name: choices
#
#  id         :integer          not null, primary key
#  page_init  :integer          not null
#  page_fin   :integer          not null
#  text       :string(255)      not null
#  picked     :integer          default(0)
#  created_at :datetime
#  updated_at :datetime
#

class Choice < ActiveRecord::Base
end
