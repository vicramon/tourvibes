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

  def headshot=(data)
    if headshot
      headshot.update_attribute :photo, data
    else
      uploads.create(photo: data, brand: 'headshot')
    end
  end

  def logo=(data)
    if logo
      logo.update_attribute :photo, data
    else
      uploads.create(photo: data, brand: 'logo')
    end
  end

end
