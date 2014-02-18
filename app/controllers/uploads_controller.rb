class UploadsController < AuthenticatedController

  def create
    @upload = Upload.new(params[:upload])

    respond_to do |format|
      if @upload.save
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

  def update
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
