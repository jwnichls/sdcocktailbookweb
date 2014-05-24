class User < ActiveRecord::Base
  has_many :cocktails
  
  acts_as_authentic do |c|
    # authlogic config options go here
    c.login_field = 'email'
  end
  
  attr_accessible :email, :name, :employer, :initials, :signed_date, :password, :password_confirmation
  
  validates :email, :presence => true
  validates :name, :presence => true
  validates :initials, :presence => true
end
