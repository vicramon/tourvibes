class UploadsController < AuthenticatedController
  expose(:tours) { current_user.tours }
  expose(:tour, ancestor: :tours)
  expose(:uploads, ancestor: :tour)
  expose(:upload, attributes: :upload_params)

  def create
    require 'pry'; binding.pry;
    if upload.save
      render json: [upload.to_jq_upload].to_json, status: :created, location: upload
    else
      render json: upload.errors, status: :unprocessable_entity
    end
  end

  def destroy
    upload = Upload.find(params[:id])
    upload.destroy if upload.tour.user == current_user
    redirect_to tour_photos_path(upload.tour)
  end

  private

  def upload_params
    params.require(:upload).permit(:photo, :tour_id, :title, :room_name, :brand, :user_id)
  end
end
