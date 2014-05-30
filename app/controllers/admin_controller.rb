class AdminController < ApplicationController
  before_filter :require_admin
  
  def index
    @cocktails = Cocktail.find(:all,:order => "created_at")
  end
end
