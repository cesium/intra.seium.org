class UsersController < ApplicationController
	respond_to :html

	before_action :set_user, only: [:show]

	def index
		@users = User.all.map { |u| u.public_profile }
		respond_with(@users)
	end

	def show
		respond_with(@user)
	end

	private

	def set_user
		@user = User.where(username: params[:username]).first.public_profile
	end

	def user_params
		params.require(:user).permit(:username)
	end
end
