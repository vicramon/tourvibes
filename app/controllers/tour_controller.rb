class TourController < ApplicationController
  before_filter :get_tour, :except => :new
  
  def get_tour
    if params[:id]
      @house = House.find_by_id(params[:id])
    elsif request.subdomain && request.subdomain != 'www'
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
    render :layout => nil
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
  end
  
  def edit_settings
    @tab = "settings"
    if request.post?
      
      # if domain entry is different than current
      if params[:custom_domain].strip != @tour.custom_domain
        require 'heroku'
        heroku = Heroku::Client.new('vicramon3@gmail.com','den267goer005')
        
        # need to add new domain
        if params[:custom_domain].present?  
          heroku.add_domain('realtour', params[:custom_domain].strip)
          heroku.add_domain('realtour', 'www.' + params[:custom_domain].strip)
        end
        
        # remove old domain if there was one
        if @tour.custom_domain.present?
          heroku.remove_domain('realtour',@tour.custom_domain)
          heroku.remove_domain('realtour','www.' + @tour.custom_domain)
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
    @pics = Upload.find(:all, :conditions => {:house_id => @house.id}, :order => "created_at desc")
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