class User < ActiveRecord::Base
  include Authem::User
  has_many :tours
  has_many :uploads

  before_create do
    self.login_hash = random_string
  end

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

  private

  def random_string
    (0...50).map { ('a'..'z').to_a[rand(26)] }.join
  end

end
