module ApplicationHelper
  def tour_visit_path(tour)
    if tour.live?
      tour_live_path(tour)
    else
      tour_preview_path(tour)
    end
  end
end
