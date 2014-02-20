class Tour < ActiveRecord::Base
  belongs_to :user
  has_many :uploads
  has_many :photos, -> { where(brand: 'photo').order("created_at desc") }, class_name: 'Upload'

  accepts_nested_attributes_for :photos

  def name
    return title if title.present?
    return address_1 if address_1.present?
    "New Tour"
  end

  def has_music
    music_file.present?
  end

  def set_default_colors
    bg_color = "#000000"
    link_color = "#e8e8e8"
    wrapper_color = "#242424"
    text_color = "#cccccc"
    title_color = "#e8e8e8"
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

  def music_file_number
    Media::SONGS[self.music_file][1]
  end

end
