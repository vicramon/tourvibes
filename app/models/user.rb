class User < ActiveRecord::Base
  has_many :houses
  
  has_attached_file :avatar, 
     :styles => { :large => "100000x100000>", :thumb => "100x100>" },
     :storage => :s3, :s3_credentials => "#{Rails.root}/config/amazon_s3.yml",
     :s3_credentials => "#{Rails.root}/config/s3.yml",
     :path => ':attachment/:id/:style.:extension',
     :bucket => 'tour_files'
     
     
     def tours_path
       return '/tours'
     end
     
     def headshot
       Upload.find(:first, :conditions => {:user_id => self.id, :brand => 'headshot'})
     end
     
     def logo
        Upload.find(:first, :conditions => {:user_id => self.id, :brand => 'logo'})
      end
      
      def has_free_tours
        if self.free_tours != nil and self.free_tours > 0
          true
        else
          false
        end
      end

end

=begin
  SCRIPT TO ADD NEW PAPERCLIP ENTRY
  
  def self.up
    add_column :users, :avatar_file_name, :string
    add_column :users, :avatar_content_type, :string
    add_column :users, :avatar_file_size, :integer
    add_column :users, :avatar_updated_at, :datetime
  end

  def self.down
    remove_column :users, :avatar_file_name
    remove_column :users, :avatar_content_type
    remove_column :users, :avatar_file_size
    remove_column :users, :avatar_updated_at
  end
  
=end
