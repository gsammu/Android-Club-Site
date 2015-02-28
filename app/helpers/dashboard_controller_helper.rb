module DashboardControllerHelper
  def humanize_countdown(deadline)
    if Time.now > deadline
      "Expired"
    else
      distance_of_time_in_words(Time.now, deadline).capitalize +
        " left. "
    end
  end
end
