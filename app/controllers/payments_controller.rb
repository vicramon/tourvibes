class PaymentsController < ApplicationController

  def charge

    Stripe.api_key = "sk_live_Ak1UC3CZ3hciZuFVYQVO1seS"

    @tour = House.find_by_id(params[:house_id])
    token = params[:stripeToken]

    charge = Stripe::Charge.create(
      :amount => 1000, # amount in cents, again
      :currency => "usd",
      :card => token,
      :description => @user.id.to_s + ' ' + @user.email
    )

    @tour.is_paid = true
    @tour.is_live = true
    @tour.save

    redirect_to "/tour/#{@tour.id}/now_live" and return
  end

  def charge_new

    Stripe.api_key = "sk_test_SI4WmEWCA7fnUtnmsH0qAZ0m"

    @tour = House.find_by_id(params[:house_id])
    token = params[:stripeToken]

    customer = Stripe::Customer.create(
      :card => token,
      :description => @user.id.to_s + ' ' + @user.email
    )

    Stripe::Charge.create(
        :amount => 1000, # in cents
        :currency => "usd",
        :customer => customer.id
    )

    @user.stripe_id = customer.id
    @user.save

    @tour.is_paid = true
    @tour.is_live = true
    @tour.save

    redirect_to "/tour/#{@tour.id}/now_live" and return

  end

  def charge_existing

    Stripe.api_key = "sk_test_SI4WmEWCA7fnUtnmsH0qAZ0m"

    @tour = House.find_by_id(params[:house_id])
    token = params[:stripeToken]

    customer_id = @user.stripe_id

    Stripe::Charge.create(
        :amount => 1000, # in cents
        :currency => "usd",
        :customer => customer_id
    )

    @tour.is_paid = true
    @tour.is_live = true
    @tour.save

    redirect_to "/tour/#{@tour.id}/now_live" and return

  end

end
