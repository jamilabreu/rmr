class CarsController < ApplicationController
  def index
    #Cars
    @cars = Car.by_make(params[:make]).by_body(params[:body]).by_year(params[:year]).by_transmission(params[:transmission])
    
    @bodies = @cars.map(&:make).map(&:body).uniq.compact.sort!
    @makes = @cars.map(&:make).map(&:make).uniq.compact.sort!
    @years = @cars.map(&:make).map(&:year).uniq.compact.sort!
    @transmissions = @cars.map(&:make).map(&:transmission).uniq.compact.sort!
    
    
    # Cars
    #if params[:ids].present?
      #filtered_cars = all_cars.delete_if { |user| (user.community_ids & params[:ids].map(&:to_i)).blank? || (user.community_ids & params[:ids].map(&:to_i)).length != params[:ids].length }
    #  filtered_cars = Car.all.keep_if { |car| params[:ids].include?(car.make.make_id.to_s) }
    #else
    #  filtered_cars = Car.all
    #end
    #@cars = Kaminari.paginate_array(filtered_cars).page(params[:page]).per(15)
    
    # Filters
    #@filters = {}
    #categories =  %w[ body make year transmission ]
    #categories.each do |c|
    #  Car.all.map(&:make).delete_if { |make| make[c.to_sym].blank? }.uniq.compact.sort_by! { |make| make[c.to_sym] }.each do |make|
    #    @filters[c] = @filters[c].blank? ? [make] : @filters[c].push(make)
    #    @filters[c].map(&"#{c}".to_sym).length == @filters[c].map(&"#{c}".to_sym).uniq.length ? nil : @filters[c].pop
    #  end
    #end
  end
  
  def new
  end

  def create
    @car = Car.new(params[:car])
    @car.user = current_user
    if @car.save
      redirect_to current_user
    end
  end 
  
  def show
    @car = Car.find(params[:id])
  end
  
  def send_request
    @car = Car.find(params[:id])
    Request.create!(:car_id => params[:id], :user_id => current_user.id)
  end
  
end
