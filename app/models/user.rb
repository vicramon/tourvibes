class User < ActiveRecord::Base
  include Authem::User
  has_many :tours

  has_attached_file :avatar,
     :styles => { :large => "100000x100000>", :thumb => "100x100>" },
     :storage => :s3, :s3_credentials => "#{Rails.root}/config/amazon_s3.yml",
     :s3_credentials => "#{Rails.root}/config/s3.yml",
     :path => ':attachment/:id/:style.:extension',
     :bucket => 'tour_files'

  def headshot
    uploads.where(brand: 'headshot').first
  end

  def logo
    uploads.where(brand: 'logo').first
  end

  def has_free_tours?
    free_tours > 0
  end

end
