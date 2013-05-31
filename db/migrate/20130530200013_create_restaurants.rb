class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :name
      t.integer :category_id
      t.integer :city_id
      t.integer :latitude
      t.integer :longitude

      t.timestamps
    end
  end
end
