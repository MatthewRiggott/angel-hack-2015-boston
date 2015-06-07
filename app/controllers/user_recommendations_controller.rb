class UserRecommendationsController < ApplicationController
	def create
		@user = User.find(params[:user_id])
		@recommendation = Recommendation.find(:recommendation_id)
		UserRecommendation.create(@user, @recommendation)	
		delete_accept_record(@user, @recommendation)
	end
end