class Favorite < ActiveRecord::Base
  attr_accessible :category_id, :city_id, :user_id, :restaurant_id
  

  belongs_to :user
  belongs_to :restaurant

  validates :user_id, :city_id, :category_id, :restaurant_id, presence: true

  validates :user_id, uniqueness: { scope: [:city_id, :category_id] }, :on => :create 


end
