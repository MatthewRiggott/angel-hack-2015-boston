class CreateRecommendations < ActiveRecord::Migration
  def change
    create_table :recommendations do |t|
      t.string :location
      t.integer :user_id
      t.string :details
      t.string :title

      t.timestamps null: false
    end
  end
end
