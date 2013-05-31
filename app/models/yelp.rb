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


  def self.store_restaurants(location)
    @location = location
    @location_for_search = location.gsub(/\s+/, "")
    pizza_restaurants = pull_yelp_restaurants(@location_for_search, "pizza")
    pizza_restaurants.each do |pizza_joint|
      pizza_place = Restaurant.new(name: "#{pizza_joint['name']}", 
                                   city_id: City.find_by_name(@location).id, 
                                   category_id: "#{Category.find_by_name('pizza').id}",
                                   latitude: pizza_joint['location']['coordinate']['latitude'],
                                   longitude: pizza_joint['location']['coordinate']['longitude'])
      pizza_place.save
    end
    cheesesteak_restaurants = pull_yelp_restaurants(@location_for_search, "cheesesteak")
    cheesesteak_restaurants.each do |cheesesteak_joint|
      cheesesteak_place = Restaurant.new(name: "#{cheesesteak_joint['name']}", 
                                         city_id: City.find_by_name(@location).id, 
                                         category_id: "#{Category.find_by_name('cheesesteak').id}",
                                         latitude: cheesesteak_joint['location']['coordinate']['latitude'],
                                         longitude: cheesesteak_joint['location']['coordinate']['longitude'])
      cheesesteak_place.save
    end
  end


end