class TourController < ApplicationController
  before_filter :get_tour, :except => :new
  
  def get_tour
    @house = House.find_by_id(params[:id])
    @tour = @house
  end
  
  def edit
    @tab = "info"
  end
  
  def edit_music
    @tab = "music"
  end
  
  def edit_settings
    @tab = "settings"
  end
  
  def edit_photos
    @tab = "photos"
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