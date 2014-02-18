class UsersController < AuthenticatedController

  def first_tour

      if request.post?
        @user.name = params[:name]
        @user.cell = params[:cell]
        @user.firm_name = params[:firm_name]
        @user.save

=begin
        if params[:photo].present?
          @photo = Upload.new(:upload => params[:photo])
          @photo.brand = "headshot"
          @photo.user_id = @user.id
          @photo.save
        end
        if params[:logo].present?
          @logo = Upload.new(:upload => params[:logo])
          @logo.brand = "logo"
          @logo.user_id = @user.id
          @logo.save
        end
=end
        flash.now[:update] = 'yes'
        @tour = House.new(:user_id => @user.id)
        @tour.set_default_colors()
        redirect_to @tour.edit_path and return
      end

  end

  def account
    @page = 'account'
    if request.post?
      @user.name = params[:name]
      @user.email = params[:email]
      @user.cell = params[:cell]
      @user.firm_name = params[:firm_name]
      @user.save

      if params[:photo].present?
        if @user.headshot
          @photo = @user.headshot
          @photo.upload = params[:photo]
        else
          @photo = Upload.new(:upload => params[:photo])
          @photo.brand = "headshot"
          @photo.user_id = @user.id
        end
        @photo.save
      end

      if params[:logo].present?
        if @user.logo
          @logo = @user.logo
          @logo.upload = params[:logo]
        else
          @logo = Upload.new(:upload => params[:logo])
          @logo.brand = "logo"
          @logo.user_id = @user.id
        end
        @logo.save
      end

      flash.now[:update] = 'yes'
    end
  end

  def my_tours
    @page = "my"
    @tours = House.find(:all, :conditions => {:user_id => @user.id}, :order => "created_at desc")
  end

end
