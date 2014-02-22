class LiveToursController < ApplicationController
  expose(:tour) { find_tour }

  def index
    (redirect_to root_domain_path and return) unless tour
    @realtor = tour.user
    render template: 'previews/show', layout: 'view_tour'
  end

  private

  def find_tour
    tour_by_subdomain || tour_by_custom_domain
  end

  def tour_by_subdomain
    subdomain = request.subdomain.presence
    Tour.find_by(subdomain: subdomain.try(:downcase), live: true)
  end

  def tour_by_custom_domain
    Tour.find_by(custom_domain: request.domain.downcase, live: true)
  end

end
