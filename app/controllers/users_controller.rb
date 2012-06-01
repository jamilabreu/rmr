class UsersController < ApplicationController
  def index
    @users = User.all
  end
  def show
    requests = Request.where("requests.user_id = (?)", current_user.id).map(&:car_id)
    @requests = Car.where("cars.id IN (?)", requests)
    @cars = Car.where("cars.user_id = (?)", current_user.id)
  end
end
