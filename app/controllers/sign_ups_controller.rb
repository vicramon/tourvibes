class SignUpsController < ApplicationController
  expose :user

  def create
    user.save
    @user.free_tours = 5
    @user.save
    session[:user_id] = @user.id
    redirect_to '/tour/first' and return
  end

  private

  def user_params
    params.require(:user).permit(:email, :password).merge(password_confirmation: params[:password])
  end

end
