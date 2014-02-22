class SessionsController < ApplicationController
  expose(:user) { User.find_by(email: params[:email]) }

  def create
    if user && user.authenticate(params[:password])
      sign_in user
      redirect_back_or_to :tours
    else
      flash[:error] = "Sorry, but your email or password is incorrect."
      redirect_to new_session_path
    end
  end

  def destroy
    sign_out
    redirect_to :root
  end

  def secure_login
    user = User.find_by(login_hash: params[:login_hash])
    tour = Tour.find(params[:tour_id])
    if user && tour
      sign_in user
      redirect_to tour_publish_path(tour)
    else
      redirect_to root_domain_path
    end
  end

end
