class PaymentsController < ApplicationController

  def create
    tour = Tour.find_by_id(params[:tour_id])
    token = params[:token]
    begin
      charge(tour, token, current_user)
      tour.update_attributes paid: true, live: true
    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to tour_publish_path(tour) and return
    end
    redirect_to "http://#{ENV.fetch('APP_DOMAIN')}#{tour_now_live_path(tour)}"
  end

  private

  def charge(tour, token, user)
    charge = Stripe::Charge.create(
      amount: 1000,
      currency: "usd",
      card: token,
      description: tour.address_1,
      metadata: {
        user_id: user.id,
        user_email: user.email,
        tour_id: tour.id
      }
    )
  end


end
