class EditTourController < ApplicationController
  expose(:tours) { current_user.tours }
  expose(:tour, ancestor: :tours, attributes: :tour_params)
end
