class UsersController < ApplicationController

  def create
    @user = User.new(params[:user])

    if @user.save
      flash[:notice] = "Your account has been created."
      redirect_to signup_url
    else
      flash[:notice] = "There was a problem creating you."
      render :template => 'cocktails/new'
    end
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user # makes our views "cleaner" and more consistent
    if @user.update_attributes(params[:user])
      flash[:notice] = "Account updated!"
      redirect_to cocktails_url
    else
      render :action => :edit
    end
  end
end
