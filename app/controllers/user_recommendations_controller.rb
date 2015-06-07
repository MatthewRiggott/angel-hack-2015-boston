class UserRecommendationsController < ApplicationController
	def create

    accept = Accept.find(params["accept_id"])
		UserRecommendation.create(user_id: current_user.id, recommendation_id: accept.recommendation.id)
		accept.destroy

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
