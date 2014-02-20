module ApplicationHelper
  def tour_visit_path(tour)
    if tour.is_live
      tour_live_path(tour)
    else
      tour_preview_path(tour)
    end
  end
end
