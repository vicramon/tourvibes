class UploadsController < ApplicationController
  
  def require_super_admin
    if not @user.is_super_admin
      redirect_to '/login' and return
    end
  end
  
  # GET /uploads
  # GET /uploads.json
  def index
    require_super_admin()
    @uploads = Upload.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @uploads }
    end
  end

  # GET /uploads/1
  # GET /uploads/1.json
  def show
    require_super_admin()
    @upload = Upload.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @upload }
    end
  end

  # GET /uploads/new
  # GET /uploads/new.json
  def new
    require_super_admin()
    @upload = Upload.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @upload }
    end
  end

  # GET /uploads/1/edit
  def edit
    require_super_admin()
    @upload = Upload.find(params[:id])
  end

  # POST /uploads
  # POST /uploads.json
  def create
    @upload = Upload.new(params[:upload])

    respond_to do |format|
      if @upload.save
        #format.html { redirect_to @upload, :notice => 'Upload was successfully created.' }
        #format.json { render :json => @upload, :status => :created, :location => @upload }
        
        format.html {
          render :json => [@upload.to_jq_upload].to_json,
          :content_type => 'text/html',
          :layout => false
        }
        
        format.json { render :json => [@upload.to_jq_upload].to_json, :status => :created, :location => @upload }
        
      else
        format.html { render :action => "new" }
        format.json { render :json => @upload.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /uploads/1
  # PUT /uploads/1.json
  def update
    require_super_admin()
    @upload = Upload.find(params[:id])

    respond_to do |format|
      if @upload.update_attributes(params[:upload])
        format.html { redirect_to @upload, :notice => 'Upload was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @upload.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /uploads/1
  # DELETE /uploads/1.json
  def destroy
    
    
    @upload = Upload.find(params[:id])
    
    @house = House.find_by_id(@upload.house_id)
    
    if not @user.is_super_admin and @house.user_id != @user.id
      redirect_to '/login' and return
    end
    
    @upload.destroy

    respond_to do |format|
      format.html { redirect_to @house.edit_photos_path }
      format.json { head :no_content }
    end
  end
end
