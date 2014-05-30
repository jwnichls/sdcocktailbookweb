class CocktailsController < ApplicationController
  before_filter :require_user, :except => [:new]

  # GET /cocktails
  # GET /cocktails.json
  def index
    @cocktails = current_user.cocktails.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @cocktails }
    end
  end

  # GET /cocktails/1
  # GET /cocktails/1.json
  def show
    @cocktail = Cocktail.find(params[:id])
    
    unless @cocktail.user.id != current_user.id and !current_user.admin?
      respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @cocktail }
      end
    else
      flash[:notice] = "You are not allowed to view that cocktail"
      redirect_to root_url
    end
  end

  # GET /cocktails/new
  # GET /cocktails/new.json
  def new
    @cocktail = Cocktail.new    
    @user = current_user ? current_user : User.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @cocktail }
    end
  end

  # GET /cocktails/1/edit
  def edit
    @cocktail = Cocktail.find(params[:id])
    
    if @cocktail.user != current_user and !current_user.admin?
      flash[:notice] = "You are not allowed to edit this cocktail"
      redirect_to root_url
    end
    
  end

  # POST /cocktails
  # POST /cocktails.json
  def create
    @cocktail = Cocktail.new(params[:cocktail])
    @cocktail.user = current_user

    respond_to do |format|
      if @cocktail.save
        format.html { redirect_to cocktails_path, notice: 'Cocktail was successfully created.' }
        format.json { render json: @cocktail, status: :created, location: @cocktail }
      else
        format.html { render action: "new" }
        format.json { render json: @cocktail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /cocktails/1
  # PUT /cocktails/1.json
  def update
    @cocktail = Cocktail.find(params[:id])

    unless @cocktail.user != current_user and !current_user.admin?
      respond_to do |format|
        if @cocktail.update_attributes(params[:cocktail])
          format.html { redirect_to @cocktail, notice: 'Cocktail was successfully updated.' }
          format.json { head :no_content }
        else
          format.html { render action: "edit" }
          format.json { render json: @cocktail.errors, status: :unprocessable_entity }
        end
      end
    else
      flash[:notice] = "You are not allowed to update this cocktail"
      redirect_to root_url
    end      
  end

  # DELETE /cocktails/1
  # DELETE /cocktails/1.json
  def destroy
    @cocktail = Cocktail.find(params[:id])

    unless @cocktail.user != current_user and !current_user.admin?
      @cocktail.destroy

      respond_to do |format|
        format.html { redirect_to cocktails_url }
        format.json { head :no_content }
      end
    else
      flash[:notice] = "You are not allowed to edit this cocktail"
      redirect_to root_url
    end
  end
end
