class Cocktail < ActiveRecord::Base
  attr_accessible :name, :recipe, :user, :image
  belongs_to :user
  mount_uploader :image, ImageUploader
  
  validates :name, :presence => true
  validates :recipe, :presence => true
end
