class CreateUserRecommendations < ActiveRecord::Migration
  def change
    create_table :user_recommendations do |t|
      t.integer :user_id
      t.integer :recommendation_id

      t.timestamps null: false
    end
  end
end
