class AcceptsController < ApplicationController
	def index
		@user = User.find_by_id(1)
		@accepts = @user.accepts
	end

	def destroy
		Accept.find(params[:id]).destroy
		redirect_to accepts_path
	end
end