class TourController < ApplicationController
  before_filter :get_tour, :except => :new
  
  def get_tour
    if params[:id]
      @house = House.find_by_id(params[:id])
    elsif request.subdomain.present? && request.subdomain != 'www'
      @house = House.find_by_subdomain!(request.subdomain)
    else
      @house = House.find_by_custom_domain(request.domain)
    end
    
    @tour = @house
  end
  
  def publish
    if @tour.is_paid
      @tour.is_live = true
      @tour.save
      redirect_to @tour.now_live_path and return
    end
  end
  
  def preview
    @pics = @tour.photos
    @realtor = @tour.user
    
    render :layout => 'view_tour'
  end
  
  def test
    render :layout => nil
  end
  
  def about
    
    render :layout => 'view_tour'
  end
  
  def map
    
    render :layout => 'view_tour'
  end
  
  def schools
    
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
      flash.now[:update] = 'yes'
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
        flash[:update] = 'yes'
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
      
      @tour.subdomain = params[:subdomain].strip
      @tour.custom_domain = params[:custom_domain].strip
      @tour.schools_url = params[:schools_url]
      @tour.autoplay = params[:autoplay]
      @tour.transition = params[:transition]
      @tour.mode = params[:mode]
      @tour.ken_burns = params[:ken_burns]
      @tour.save
      flash[:update] = 'yes'
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
      flash.now[:update] = 'yes'
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
      @house.save
      
      redirect_to "/tour/#{@house.id}/edit"
      
    end
  end
  
  
end