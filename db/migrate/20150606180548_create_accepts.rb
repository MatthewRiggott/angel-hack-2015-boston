class CreateAccepts < ActiveRecord::Migration
  def change
    create_table :accepts do |t|
      t.integer :user_id
      t.integer :recommendation_id

      t.timestamps null: false
    end
  end
end
