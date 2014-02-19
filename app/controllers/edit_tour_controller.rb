class EditTourController < ApplicationController
  expose(:tours) { current_user.tours }
  expose(:tour, ancestor: :tours)
end
