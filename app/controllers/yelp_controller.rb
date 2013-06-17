class YelpController < ApplicationController
	before_filter :authenticate_user!

	def index
		
		# @location = current_user.city.gsub(/\s+/, "")
		@location = 'Philadelphia'
		@category = "Pizza"
		
		if Favorite.where(user_id: current_user.id, category_id: Category.find_by_name(@category).id, city_id: City.find_by_name(@location).id).any?
			@favorite = Favorite.where(user_id: current_user.id, category_id: Category.find_by_name(@category).id, city_id: City.find_by_name(@location).id).first
		else
			@favorite = Favorite.new 
		end

		@restaurant_list = Restaurant.where(city_id: City.find_by_name(@location).id , category_id: Category.find_by_name(@category).id) 
	end

	def search
		@location = params[:location]
		@category = params[:category]

		@restaurant_list = Restaurant.where(city_id: City.find_by_name(@location).id , category_id: Category.find_by_name(@category).id)
		
		if Favorite.where(user_id: current_user.id, category_id: Category.find_by_name(@category).id, city_id: City.find_by_name(@location).id).any?
			@favorite = Favorite.where(user_id: current_user.id, category_id: Category.find_by_name(@category).id, city_id: City.find_by_name(@location).id).first
		else
			@favorite = Favorite.new 
		end
			respond_to do |format|
				format.js
				format.html
			end

	end


end