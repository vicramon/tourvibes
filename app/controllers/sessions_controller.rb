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

end
