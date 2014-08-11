class Permission < ActiveRecord::Base
  attr_accessible :type, :power
  #has_many :employees
end
