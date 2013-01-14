class House < ActiveRecord::Base
  belongs_to :user
  has_many :uploads
  
  def name
    if self.title.present?
      self.title
    else
      self.address_1
    end
  end
  
  def now_live_path
    return "/tour/#{self.id}/now_live"
  end
  
  #fix this later
  def live_path
    return self.preview_path
  end
  
  def about_path
    "/tour/#{self.id}/about"
  end
  
  def map_path
    "/tour/#{self.id}/map"
  end
  
  def schools_path
    "/tour/#{self.id}/schools"
  end
  
  def takedown_path
    return "/tour/#{self.id}/takedown"
  end
  
  def edit_path
    return "/tour/#{self.id}/edit"
  end
  
  def preview_path
    return "/tour/#{self.id}/preview"
  end
  
  def publish_path
    return "/tour/#{self.id}/publish"
  end
  
  def edit_photos_path
    self.edit_path + '/photos'
  end
  
  def edit_settings_path
    self.edit_path + '/settings'
  end
  
  def edit_music_path
    self.edit_path + '/music'
  end
  
  def status
    if self.is_live
      "Live"
    else
      "Not Live"
    end
  end
  
end
