class UserRecommendation < ActiveRecord::Base
	has_many :users
	has_many :recommendations

	def delete_accept_record(user, recommendation)
		accept = Accept.find(user_id: user.id, recommendation_id: recommendation.id)
		accept.destroy if accept
	end
end
