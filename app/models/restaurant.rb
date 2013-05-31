class Restaurant < ActiveRecord::Base
  attr_accessible :category_id, :city_id, :latitude, :longitude, :name

  belongs_to :city
  belongs_to :category
  
end
