module ApplicationHelper
  def alerts
    alert = (flash[:notice] || flash[:alert] || flash[:error])

    if alert
      alert_generator alert
    end
  end

  def alert_generator msg
    js add_gritter(msg, :title => "File Cabinet", sticky: false)
  end
end
