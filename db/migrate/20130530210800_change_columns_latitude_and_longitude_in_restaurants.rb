class ChangeColumnsLatitudeAndLongitudeInRestaurants < ActiveRecord::Migration
  def change
  	change_column :restaurants, :latitude, :float
  	change_column :restaurants, :longitude, :float
  end
end
