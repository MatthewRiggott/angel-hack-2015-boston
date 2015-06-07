class AcceptsController < ApplicationController
	def index
		@user = current_user
		@accepts = @user.accepts

	end

	def destroy
		Accept.find(params[:id]).destroy
		redirect_to accepts_path
	end
end
