class LiveToursController < ApplicationController
  expose(:tour) { find_tour }

  def index
    redirect_to root_domain_path if tour.nil? or !tour.live?
    @realtor = tour.user
    render :template => 'previews/show', :layout => 'view_tour'
  end

  private

  def find_tour
    self.tour = Tour.find_by(subdomain: request.subdomain) || Tour.find_by(custom_domain: request.domain)
  end

end
