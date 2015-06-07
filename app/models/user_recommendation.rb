class UserRecommendation < ActiveRecord::Base
	has_many :users
	has_many :recommendations

	def self.delete_accept_record(user, recommendation)
		accept = Accept.find_by(user_id: user.id, recommendation_id: recommendation.id)
		accept.destroy if accept
	end
end
