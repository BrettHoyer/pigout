require 'rubygems'
require 'oauth'
require 'json'
require 'awesome_print'
class Yelp 

  def self.pull_yelp_restaurants(loc, cat)
    location = loc
    category = cat
    api_host = 'api.yelp.com'
    consumer = OAuth::Consumer.new(ENV['CONSUMER_KEY'], ENV['CONSUMER_SECRET'], {:site => "http://#{api_host}"})
    access_token = OAuth::AccessToken.new(consumer, ENV['TOKEN'], ENV['TOKEN_SECRET'])
    path = "/v2/search?term=restaurants,#{category}&sort=0&location=#{location}&radius_filter=40000"
    parsed = JSON.parse(access_token.get(path).body)

    total = parsed['total'] 
    businesses = parsed['businesses']

    businesses
  end


  def self.store_restaurants(location, category)
    @location = location
    @location_for_search = location.gsub(/\s+/, "")

    @category = category
    @category_for_search = category.gsub(/\s+/, "")

    restaurants = pull_yelp_restaurants(@location_for_search, @category_for_search)
    restaurants.each do |restaurant|
      new_restaurant = Restaurant.new(name: "#{restaurant['name']}", 
                                   city_id: City.find_by_name(@location).id, 
                                   category_id: Category.find_by_name(@category).id,
                                   latitude: restaurant['location']['coordinate']['latitude'],
                                   longitude: restaurant['location']['coordinate']['longitude'])
      new_restaurant.save
    end
  end


end