class UsersController < ApplicationController
	before_action :set_user, only: [:show]

	def index
		@users = User.all.map { |u| u.public_profile }
		respond_with(@users)
	end

	def show
		@social = check_accounts
		respond_with(@user)
	end

	private

	# Check if there are any social accounts
	def check_accounts
		( @user.facebook_account != nil && @user.facebook_account != "" ) ||
		( @user.twitter_account != nil && @user.twitter_account != "" ) ||
		( @user.github_account != nil && @user.github_account != "" ) ||
		( @user.google_plus_account != nil && @user.google_plus_account != "" )
	end

	def set_user
		@user = User.where(username: params[:username]).first.public_profile
	end

	def user_params
		params.require(:user).permit(:username)
	end
end
