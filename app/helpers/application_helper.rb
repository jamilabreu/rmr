module ApplicationHelper
  def home_page
    params[:controller] == "cars" && params[:action] == "index"
  end  

  def profile_page
    params[:controller] == "users" && params[:action] == "show"
  end
  
  def selected?(symbol, value)
    params[symbol].present? && params[symbol].include?(value.to_s)
  end
  
  def new_filter_ids(value)
    selected?(value) ? (params[:ids] - [value.id.to_s]) : (params[:ids].to_a | [value.id.to_s])
  end
  
  def requested?(car)
    Request.where(car_id: car, user_id: current_user.id).present?
  end  
  
  def car_owner?(car)
    car.user == current_user
  end
end
