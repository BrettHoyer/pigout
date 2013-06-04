class YelpController < ApplicationController
	before_filter :authenticate_user!

	def index
		@favorite = Favorite.new
		# @location = current_user.city.gsub(/\s+/, "")
		@location = 'Philadelphia'
		@category = "Pizza"
		@restaurant_list = Restaurant.where(city_id: City.find_by_name(@location).id , category_id: Category.find_by_name(@category).id) 
	end

	def search
		@location = params[:location]
		@category = params[:category]

		@restaurant_list = Restaurant.where(city_id: City.find_by_name(@location).id , category_id: Category.find_by_name(@category).id)
		@favorite = Favorite.new
			respond_to do |format|
				format.js
				format.html
			end

	end


end