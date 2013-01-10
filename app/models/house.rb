class House < ActiveRecord::Base
  belongs_to :user
  
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
