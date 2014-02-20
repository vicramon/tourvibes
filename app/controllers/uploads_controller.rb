class UploadsController < AuthenticatedController
  expose(:tours) { current_user.tours }
  expose(:tour, ancestor: :tours)
  expose(:uploads, ancestor: :tour)
  expose(:upload, attributes: :upload_params)

  def create
    if upload.save
      render json: [upload.to_jq_upload].to_json, status: :created, location: upload
    else
      render json: upload.errors, status: :unprocessable_entity
    end
  end

  def update
    @upload = Upload.find(params[:id])

    respond_to do |format|
      if @upload.update_attributes(upload_params)
        format.html { redirect_to @upload, :notice => 'Upload was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @upload.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    upload.destroy if upload

    respond_to do |format|
      format.html { redirect_to tour_photos_path(tour) }
      format.json { head :no_content }
    end
  end

  private

  def upload_params
    params.require(:upload).permit(:upload_file_name, :upload_content_type, :upload_file_name, :upload_updated_at, :tour_id, :title, :room_name, :brand, :user_id)
  end
end
