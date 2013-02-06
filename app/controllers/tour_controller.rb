class TourController < ApplicationController
  before_filter :get_tour, :except => :new
  before_filter :require_user, :except => [:live, :new, :not_live, :preview]
  
  def get_tour
        
    if params[:id]
      @house = House.find_by_id(params[:id])
    elsif request.subdomain.present? && request.subdomain != 'www'
      @house = House.find_by_subdomain!(request.subdomain.downcase)
    else
      @house = House.find_by_custom_domain(request.domain.downcase)
    end
    
    @tour = @house
    
  end
  
  def require_user
    if not @user
      redirect_to '/login' and return
    end
    if @tour.user != @user and not @user.is_super_admin
      redirect_to '/login' and return
    end
  end
  
  def publish
    
    if not @tour.is_paid && @user.free_tours > 0
      @tour.is_paid = true
      @user.free_tours -= 1
      @user.save
    end
    
    if @tour.is_paid
      @tour.is_live = true
      @tour.save
      redirect_to @tour.now_live_path and return
    end
    
    if Rails.env.production? and not request.ssl?
      redirect_to "https://tourvibes.com/secure_login/#{@tour.id}"
    end
    
  end
  
  #gets info necessary for slidwhow
  def get_slideshow
    @pics = @tour.photos
    @realtor = @tour.user
  end
  
  def preview
    get_slideshow
    
    if @pics.size == 0 
      flash[:message] = "You must upload photos before you can preview your tour."
      redirect_to @tour.edit_photos_path and return
    end
    
    render :layout => 'view_tour'
  end
  
  def live
    get_slideshow
    
    if not @tour.is_paid or not @tour.is_live
      redirect_to @tour.not_live_path and return
    end
    
    render :template => '/tour/preview', :layout => 'view_tour'
    
  end
  
  def test_preview
    @pics = @tour.photos
    @realtor = @tour.user
    
    render :layout => 'view_tour'
  end
  
  def test
    render :layout => 'view_tour'
  end  
  
 
  def edit
    @tab = "info"
    if request.post?
      @tour.address_1 = params[:address_1]
      @tour.address_2 = params[:address_2]
      @tour.city = params[:city]
      @tour.state = params[:state]
      @tour.zip = params[:zip]
      @tour.title = params[:title]
      @tour.desc = params[:desc]
      @tour.save
      
      if params[:commit] == "Save Changes"
        flash.now[:update] = 'yes'
      else
        flash[:update] = 'yes'
        redirect_to @tour.edit_photos_path and return
      end
      
    end
  end
  
  def edit_music
    @tab = "music"
    if request.post?
      @tour.music_file = params[:music_file]
      @tour.autoplay_music = params[:autoplay_music]
      @tour.save
      
      if params[:music].present? 
        @tour.music_file = nil
        @tour.save
        if @tour.music
          @music = @tour.music
          @music.music = params[:music]
        else
          @music = Upload.new(:music => params[:music])
          @music.brand = "music"
          @music.house_id = @tour.id
        end
        @music.save
      end
      
      if params[:commit] == "Save Changes"
        flash.now[:update] = 'yes'
      else
        flash[:update] = 'yes'
        redirect_to @tour.edit_settings_path and return
      end
      
      # delete music file if not being used.
      if not params[:music].present? and params[:music_file].present? and @tour.music
        @tour.music.destroy
      end
        
      
    end
  end
  
  def edit_settings
    @tab = "settings"
    if request.post?
      
      # if domain entry is different than current
      if params[:custom_domain].strip != @tour.custom_domain
        #require 'heroku'
        #heroku = Heroku::Client.new('vicramon3@gmail.com','den267goer005')
        require 'heroku-api'
        heroku = Heroku::API.new(:username => 'vicramon3@gmail.com', :password => 'den267goer005')
        
        # need to add new domain
        if params[:custom_domain].present?  
          heroku.post_domain('realtour', params[:custom_domain].strip)
          heroku.post_domain('realtour', 'www.' + params[:custom_domain].strip)
        end
        
        # remove old domain if there was one
        if @tour.custom_domain.present?
          heroku.delete_domain('realtour',@tour.custom_domain)
          heroku.delete_domain('realtour','www.' + @tour.custom_domain)
        end
        
      end
      
      @tour.subdomain = params[:subdomain].strip.downcase
      @tour.custom_domain = params[:custom_domain].strip.downcase
      @tour.schools_url = params[:schools_url]
      @tour.autoplay = params[:autoplay]
      @tour.transition = params[:transition]
      @tour.mode = params[:mode]
      @tour.ken_burns = params[:ken_burns]
      
      @tour.bg_color = params[:bg_color]
      @tour.link_color = params[:link_color]
      @tour.wrapper_color = params[:wrapper_color]
      @tour.text_color = params[:text_color]
      @tour.title_color = params[:title_color]
      
      @tour.save
      
      if params[:commit] == "Save Changes"
        flash.now[:update] = 'yes'
      else
        redirect_to @tour.publish_path and return
      end
      
    end
  end
  
  def edit_photos
    @tab = "photos"
    @pics = @tour.photos
    if request.post?
      i = 0
      for title in params[:title]
        @pics[i].room_name = title
        @pics[i].save
        i += 1
      end
      
      if params[:commit] == "Save Descriptions"
        flash.now[:update] = 'yes'
      else
        flash[:update] = 'yes'
        redirect_to @tour.edit_music_path and return
      end
      
    end
  end
  
  def takedown
    @tour.is_live = false
    @tour.save
    flash[:update] = 'yes'
    redirect_to @tour.edit_path and return
  end
  
  
  def new
    @page = "new"
    
    if request.post?
      @house = House.new
      @house.address_1 = params[:address_1]
      @house.address_2 = params[:address_2]
      @house.city = params[:city]
      @house.state = params[:state]
      @house.zip = params[:zip]
      @house.user_id = @user.id
      @house.bg_color = "#000000"
      @house.link_color = "#e8e8e8"
      @house.wrapper_color = "#242424"
      @house.text_color = "#cccccc"
      @house.title_color = "#e8e8e8"
      
      @house.save
      
      redirect_to "/tour/#{@house.id}/edit"
      
    end
  end
  
  
end