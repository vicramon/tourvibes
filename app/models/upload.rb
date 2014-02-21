class Upload < ActiveRecord::Base
  include Rails.application.routes.url_helpers
  belongs_to :tour

  has_attached_file :photo,
    styles: { large: "1800x1400>", thumb: "100x100>", middle: "150x110!" },
    path: ':attachment/:id/:style.:extension',
    bucket: 'tour_files'

  def to_jq_upload
    { files: [{
      "name" => read_attribute(:photo_file_name),
      "size" => read_attribute(:photo_file_size),
      "url" => photo.url(:thumb),
      "delete_url" => upload_path(self),
      "delete_type" => "DELETE",
      "thumbnail_url" => photo.url(:thumb)
    }]
    }
  end

end
