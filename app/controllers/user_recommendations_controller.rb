class UserRecommendationsController < ApplicationController
  def new
  end
  def create
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
