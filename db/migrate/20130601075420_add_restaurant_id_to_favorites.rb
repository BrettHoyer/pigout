class AddRestaurantIdToFavorites < ActiveRecord::Migration
  def change
    add_column :favorites, :restaurant_id, :integer
  end
end
