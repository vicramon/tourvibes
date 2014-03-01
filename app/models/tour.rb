class Tour < ActiveRecord::Base
  belongs_to :user
  has_many :uploads
  has_many :photos, -> { where(brand: 'photo').order("created_at asc") }, class_name: 'Upload'

  accepts_nested_attributes_for :photos
  validates :subdomain, :custom_domain, uniqueness: true, allow_blank: true

  def name
    return title if title.present?
    return address_1 if address_1.present?
    "New Tour"
  end

  def has_music
    music_file.present?
  end

  def set_default_colors
    self.bg_color = "#000000"
    self.link_color = "#e8e8e8"
    self.wrapper_color = "#242424"
    self.text_color = "#cccccc"
    self.title_color = "#e8e8e8"
    save
  end

   def music_name
     return Media::SONGS[self.music_file.to_i][0] if music_file.present?
     "No music file"
   end

   def music_src
     "https://s3.amazonaws.com/tour_files/tracks/#{self.music_file_number}.mp3" if music_file.present?
   end

  def status
    live? ? "Live" : "Not Live"
  end

  def live_path
    if custom_domain.present?
      outgoing_custom_domain
    else
      outgoing_subdomain
    end
  end

  def outgoing_custom_domain
    if custom_domain.include? "http://"
      custom_domain
    else
      "http://#{custom_domain}"
    end
  end

  def outgoing_subdomain
    "http://#{subdomain}.tourvibes.com"
  end

  def music_file_number
    Media::SONGS[self.music_file][1]
  end

  def outgoing_schools_url
    if schools_url.include? "http://"
      schools_url
    else
      "http://" + schools_url
    end
  end

  def pretty_address
    address = address_1
    address += "<br />#{address_2}" if address_2.present?
    address += "<br />#{city}, #{state} #{zip}"
  end

  def no_live_path?
    custom_domain.blank? && subdomain.blank?
  end

end
