class SignUpsController < ApplicationController
  expose :user, attributes: :user_params

  def create
    require 'pry'; binding.pry;
    if user.save
      user.update_attribute :free_tours, 5
      redirect_to '/tour/first'
    else
      # TODO - show email not unique error message
      flash[:error] = true
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password).merge(password_confirmation: params[:user][:password])
  end

end
