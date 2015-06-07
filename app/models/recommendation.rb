class Recommendation < ActiveRecord::Base
	belongs_to :user_recommendation
	has_many :accepts
	has_many :users, through: :user_recommendations
end
