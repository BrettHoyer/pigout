class Favorite < ActiveRecord::Base
  attr_accessible :category_id, :city_id, :user_id, :restaurant_id
  
  before_validation :check_and_destroy_other_favorite

  belongs_to :user
  belongs_to :restaurant

  validates :user_id, :city_id, :category_id, :restaurant_id, presence: true

  validates_uniqueness_of :user_id, scope: [:city_id, :category_id]

  

  def check_and_destroy_other_favorite
  	Favorite.where(user_id: self.user_id, category_id: self.category_id, city_id: self.city_id).destroy_all
  end

end
