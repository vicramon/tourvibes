class Upload < ActiveRecord::Base
  belongs_to :house
  attr_accessible :upload
  attr_accessible :house_id
  attr_accessible :music
  attr_accessible :brand
  
  #has_attached_file :upload
  
  has_attached_file :upload, 
     :styles => { :large => "1800x1400>", :thumb => "100x100>", :middle => "150x110!" },
     :storage => :s3, :s3_credentials => "#{Rails.root}/config/amazon_s3.yml",
     :s3_credentials => "#{Rails.root}/config/s3.yml",
     :path => ':attachment/:id/:style.:extension',
     :bucket => 'tour_files'
     
  has_attached_file :music, 
      :storage => :s3, :s3_credentials => "#{Rails.root}/config/amazon_s3.yml",
      :s3_credentials => "#{Rails.root}/config/s3.yml",
      :path => ':attachment/:id/:style.:extension',
      :bucket => 'tour_files'

  include Rails.application.routes.url_helpers

  def to_jq_upload
    {
      "name" => read_attribute(:upload_file_name),
      "size" => read_attribute(:upload_file_size),
      "url" => upload.url(:thumb),
      "delete_url" => upload_path(self),
      "delete_type" => "DELETE",
      "thumbnail_url" => upload.url(:thumb)
    }
  end
  
  
end
