class Restaurant < ActiveRecord::Base
  attr_accessible :category_id, :city_id, :latitude, :longitude, :name, :phone, :url, :rating, :rating_image, :display_address, :neighborhoods

  has_many :favorites
  belongs_to :city
  belongs_to :category
  
end
