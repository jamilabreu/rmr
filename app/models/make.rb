class Make < ActiveRecord::Base
  has_many :cars  
  def display_name
   "#{year} #{make} #{name} #{trim}"
  end
end
