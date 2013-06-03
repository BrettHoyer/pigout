class AddNumerousColumnsToRestaurants < ActiveRecord::Migration
  def change
    add_column :restaurants, :phone, :string
    add_column :restaurants, :url, :string
    add_column :restaurants, :rating, :string
    add_column :restaurants, :rating_image, :string
    add_column :restaurants, :display_address, :string
    add_column :restaurants, :neighborhoods, :string
  end
end
