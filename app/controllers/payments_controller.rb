class PaymentsController < ApplicationController

  
  # simple charge, doesn't save card or customer
  def charge
    
    # set your secret key: remember to change this to your live secret key in production
    Stripe.api_key = "sk_live_Ak1UC3CZ3hciZuFVYQVO1seS"

    #sk_test_SI4WmEWCA7fnUtnmsH0qAZ0m

    @tour = House.find_by_id(params[:house_id])
    token = params[:stripeToken]
    
    # create the charge on Stripe's servers - this will charge the user's card
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
    
    # set your secret key: remember to change this to your live secret key in production
    Stripe.api_key = "sk_test_SI4WmEWCA7fnUtnmsH0qAZ0m"

    @tour = House.find_by_id(params[:house_id])
    token = params[:stripeToken]
    
    # create a Customer
    customer = Stripe::Customer.create(
      :card => token,
      :description => @user.id.to_s + ' ' + @user.email
    )

    # charge the Customer instead of the card
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
    
    # set your secret key: remember to change this to your live secret key in production
    Stripe.api_key = "sk_test_SI4WmEWCA7fnUtnmsH0qAZ0m"

    @tour = House.find_by_id(params[:house_id])
    token = params[:stripeToken]
    
    # create a Customer
    customer_id = @user.stripe_id

    # charge the Customer instead of the card
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
