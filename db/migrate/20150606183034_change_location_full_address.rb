class ChangeLocationFullAddress < ActiveRecord::Migration
  def change
    remove_column :recommendations, :location, :string
    add_column :recommendations, :address, :string
    add_column :recommendations, :address2, :string
    add_column :recommendations, :city, :string
    add_column :recommendations, :state, :string
    add_column :recommendations, :zip_code, :string
    add_column :recommendations, :longitude, :float
    add_column :recommendations, :latitude, :float
  end
end
