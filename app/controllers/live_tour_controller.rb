class LiveTourController < ApplicationController

  def live
    unless @tour.paid? and @tour.live?
      redirect_to tour_not_live_path(tour) and return
    end
    render :template => '/tour/preview', :layout => 'view_tour'
  end

end
