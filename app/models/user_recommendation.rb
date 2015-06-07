class UserRecommendation < ActiveRecord::Base
	belongs_to :user
	belongs_to :recommendation

	def self.delete_accept_record(user, recommendation)
		accept = Accept.find_by(user_id: user.id, recommendation_id: recommendation.id)
		accept.destroy if accept
	end
end
