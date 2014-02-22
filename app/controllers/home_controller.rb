class HomeController < ApplicationController

  def index
    redirect_to :tours if current_user
  end

end
