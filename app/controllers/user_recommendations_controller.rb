class UserRecommendationsController < ApplicationController
	def create
		@user = User.find(params["create_user_rec"]["user_id"])
		@recommendation = Recommendation.find(params["create_user_rec"]["recommendation_id"])
		UserRecommendation.create(user_id: @user.id, recommendation_id: @recommendation.id)
		UserRecommendation.delete_accept_record(@user, @recommendation)
		redirect_to accepts_path
	end

  def index
    @event_array = []
    @userrecommendations = UserRecommendation.where(user_id: current_user.id)

    @userrecommendations.each do |element|
      @event_array << element.recommendation
    end

    respond_to do |format|
      format.json {render json: @event_array}
      format.html { @event_array}
    end
  end
end
