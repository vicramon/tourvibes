class UsersController < AuthenticatedController
  expose(:user) { current_user }

  def first_tour

  end

  def first_tour_submit
    user.update_attributes(user_params)
    redirect_to new_tour_path
  end

  def update
    user.update_attributes(user_params)
    flash[:update] = true
    redirect_to account_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :cell, :firm_name, :headshot, :logo)
  end

end
