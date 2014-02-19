class SignUpsController < ApplicationController
  expose :user, attributes: :user_params

  def create
    if user.save
      sign_in user
      user.update_attribute :free_tours, 5
      redirect_to new_tour_path
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
