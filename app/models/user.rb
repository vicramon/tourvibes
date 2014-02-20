class User < ActiveRecord::Base
  include Authem::User
  has_many :tours
  has_many :uploads

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
