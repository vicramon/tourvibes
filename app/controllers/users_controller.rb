class UsersController < AuthenticatedController
  expose(:user) { current_user }

  # def first_tour
  #   @user.name = params[:name]
  #   @user.cell = params[:cell]
  #   @user.firm_name = params[:firm_name]
  #   @user.save
  #   flash.now[:update] = 'yes'
  #   @tour = House.new(:user_id => @user.id)
  #   @tour.set_default_colors()
  #   redirect_to @tour.edit_path and return
  # end

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
