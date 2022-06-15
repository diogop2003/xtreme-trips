module TrailHelper
  def trail_type(trail)
    case trail
    when "Hiking"
      "fas fa-hiking icon-color"
    when "Bike"
     "fas fa-biking icon-color"
    when "Horse"
      "fas fa-horse icon-color"
    when "Quad"
      "fas fa-motorcycle icon-color"
    end
  end
end
