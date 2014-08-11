class Employee < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :enabled, :name, :mobile, :address, :role
  # attr_accessible :title, :body

  scope :employee_enabled, where(:enabled => true)
  #belongs_to :permission
end
