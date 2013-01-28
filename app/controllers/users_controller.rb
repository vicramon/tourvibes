class UsersController < ApplicationController
    
  def require_super_admin
    if not @user.is_super_admin
      redirect_to '/login' and return
    end
  end
  
  def require_login
    if not @user
      redirect_to '/login' and return
    end
  end
  
  def first_tour
    if not @user
      redirect_to '/login' and return
    end
    
      if request.post?
        @user.name = params[:name]
        @user.cell = params[:cell]
        @user.firm_name = params[:firm_name]
        @user.save

=begin
        if params[:photo].present? 
          @photo = Upload.new(:upload => params[:photo])
          @photo.brand = "headshot"
          @photo.user_id = @user.id
          @photo.save
        end
        if params[:logo].present? 
          @logo = Upload.new(:upload => params[:logo])
          @logo.brand = "logo"
          @logo.user_id = @user.id
          @logo.save
        end
=end        
        flash.now[:update] = 'yes'
        @tour = House.new(:user_id => @user.id)
        @tour.set_default_colors()
        redirect_to @tour.edit_path and return
      end
    
  end
  
  def account
    @page = 'account'
    if not @user
      redirect_to '/login' and return
    end
    if request.post?
      @user.name = params[:name]
      @user.email = params[:email]
      @user.cell = params[:cell]
      @user.firm_name = params[:firm_name]
      @user.save
      
      if params[:photo].present? 
        if @user.headshot
          @photo = @user.headshot
          @photo.upload = params[:photo]
        else
          @photo = Upload.new(:upload => params[:photo])
          @photo.brand = "headshot"
          @photo.user_id = @user.id
        end
        @photo.save
      end
      
      if params[:logo].present? 
        if @user.logo
          @logo = @user.logo
          @logo.upload = params[:logo]
        else
          @logo = Upload.new(:upload => params[:logo])
          @logo.brand = "logo"
          @logo.user_id = @user.id
        end
        @logo.save
      end
      
      
      flash.now[:update] = 'yes'
    end
  end
  
  def my_tours
    if not @user
      redirect_to '/login' and return
    end
    @page = "my"
    @tours = House.find(:all, :conditions => {:user_id => @user.id}, :order => "created_at desc")
  end
  
  # GET /users
  # GET /users.json
  def index
    require_super_admin()
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @users }
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    require_super_admin()
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @user }
    end
  end

  # GET /users/new
  # GET /users/new.json
  def new
    require_super_admin()
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @user }
    end
  end

  # GET /users/1/edit
  def edit
    require_super_admin()
    @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.json
  def create
    require_super_admin()
    @user = User.new(params[:user])

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, :notice => 'User was successfully created.' }
        format.json { render :json => @user, :status => :created, :location => @user }
      else
        format.html { render :action => "new" }
        format.json { render :json => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
    require_super_admin()
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to @user, :notice => 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    require_super_admin()
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end
end
