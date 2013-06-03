class CreateFavorites < ActiveRecord::Migration
  def change
    create_table :favorites do |t|
      t.integer :user_id
      t.integer :category_id
      t.integer :city_id

      t.timestamps
    end
  end
end
