class RecommendationsController < ApplicationController
  before_action :set_recommendation, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:edit, :update, :destroy, :create]
  # GET /recommendations
  # GET /recommendations.json
  def index
    @recommendations = Recommendation.all
    respond_to do |format|
      format.json {render json: @recommendations}
      format.html {@recommendations}
    end
  end

  # GET /recommendations/1
  # GET /recommendations/1.json
  def show
  end

  # GET /recommendations/new
  def new
    @recommendation = Recommendation.new
  end

  # GET /recommendations/1/edit
  def edit
  end

  # POST /recommendations
  # POST /recommendations.json
  def create
    @recommendation = Recommendation.new(recommendation_params)
    @recommendation.user = current_user
    respond_to do |format|
      if @recommendation.save
        user_rec = UserRecommendation.new(user_id: @recommendation.user_id, recommendation_id: @recommendation.id )
        user_rec.save
        format.html { redirect_to @recommendation, notice: 'Recommendation was successfully created.' }
        format.json { render :show, status: :created, location: @recommendation }
      else
        format.html { render :new }
        format.json { render json: @recommendation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /recommendations/1
  # PATCH/PUT /recommendations/1.json
  def update
    respond_to do |format|
      if @recommendation.update(recommendation_params)
        format.html { redirect_to @recommendation, notice: 'Recommendation was successfully updated.' }
        format.json { render :show, status: :ok, location: @recommendation }
      else
        format.html { render :edit }
        format.json { render json: @recommendation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /recommendations/1
  # DELETE /recommendations/1.json
  def destroy
    @recommendation.destroy

    redirect_to user_recommendations_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recommendation
      @recommendation = Recommendation.find(params[:id])
    end

  protected
    def recommendation_params
      params.require(:recommendation).permit(:title, :details, :address, :address_2,
        :city, :state, :zip_code, :longitude, :latitude)
    end
end
