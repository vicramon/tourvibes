class Tour < ActiveRecord::Base
  belongs_to :user
  has_many :uploads

  SONGS = [
    ["",nil],
    ["Bon Sonata in G Minor",1],
    ["Claire De Lune",2],
    ["Fur Elise",3],
    ["Gymnopedie No 1",4],
    ["Gymnopedie No 3",5],
    ["Il. Intermezzo",6],
    ["Prelude in C Minor",7],
    ["Romance De Juegos Prohobidos",8],
    ["Suite Espanola",9]
    ]

  def name
    if self.title.present?
      self.title
    elsif self.address_1.present?
      self.address_1
    else
      "New Tour"
    end
  end

  def photos
    uploads.where(brand: 'photo').order("created_at desc")
  end

  def music
    uploads.where(brand: 'music')
   end

   def has_music
     self.music_file or self.music
   end

   def set_default_colors
    self.bg_color = "#000000"
    self.link_color = "#e8e8e8"
    self.wrapper_color = "#242424"
    self.text_color = "#cccccc"
    self.title_color = "#e8e8e8"
    self.save
   end

   def music_name
     if self.music_file
        SONGS[self.music_file.to_i][0]
     elsif self.music
        self.music.music_file_name
     else
       "No music file"
     end
   end

   def music_file_number
     SONGS[self.music_file][1]
   end

   def music_src
     if self.music_file
       "https://s3.amazonaws.com/tour_files/tracks/#{self.music_file_number}.mp3"
     elsif self.music
       self.music.music.url
     end
   end

  def now_live_path
    return "/tour/#{self.id}/now_live"
  end

  #fix this later
  def live_path
    if self.is_live && self.is_paid
      return self.preview_path
    else
      return self.not_live_path
    end
  end

  def not_live_path
    "/tour/#{self.id}/not_live"
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
