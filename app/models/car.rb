class Car < ActiveRecord::Base
  mount_uploader :image1, ImageUploader
  mount_uploader :image2, ImageUploader
  mount_uploader :image3, ImageUploader
  mount_uploader :image4, ImageUploader
  mount_uploader :image5, ImageUploader
  mount_uploader :image6, ImageUploader
  
  belongs_to :make
  belongs_to :user

  scope :by_make, lambda { |make| joins(:make).where("makes.make LIKE ?", make) unless make.blank? }
  scope :by_body, lambda { |x| joins(:make).where("makes.body = ?", x) unless x.blank? }
  scope :by_year, lambda { |x| joins(:make).where("makes.year = ?", x) unless x.blank? }
  scope :by_transmission, lambda { |x| joins(:make).where("makes.transmission = ?", x) unless x.blank? }
  
  def display_name
   "#{make.year} #{make.make} #{make.name} #{make.trim}"
  end
end
