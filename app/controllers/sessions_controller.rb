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

  # TODO: -login on ssl?
  # def secure_login
  #   @page = "login"
  #   @tour = House.find_by_id(params[:id])

  #   if request.post?
  #     u = User.find(:first, :conditions => {:email => params[:email].strip})
  #     if u
  #       if u.password == Digest::SHA2.hexdigest(u.salt + params[:password].strip)
  #         session[:user_id] = u.id
  #         redirect_to @tour.publish_path and return
  #       end
  #     end
  #     flash[:error] = "yes"
  #   end
  # end

end
