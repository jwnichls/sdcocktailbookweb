class Cocktail < ActiveRecord::Base
  belongs_to :user
  attr_accessible :name, :recipe, :user
  
  validates :name, :presence => true
  validates :recipe, :presence => true
end
