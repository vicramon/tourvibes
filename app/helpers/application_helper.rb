module ApplicationHelper
  def tour_visit_path(tour)
    if tour.live?
      tour_live_path(tour)
    else
      tour_preview_path(tour)
    end
  end

  def active_link_to(text, path, link_options={})
    if link_options[:exact]
      active = request.path == path.to_s
      link_options.delete(:exact)
    else
      active = request.path.include?(path.to_s)
    end
    active_class = active ? 'active' : nil
    link_options[:class] = active_class
    link_to text, path, link_options
  end

  def on_off_options
    [['on', true], ['off', false]]
  end

end
