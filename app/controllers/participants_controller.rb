class ParticipantsController < ApplicationController
	before_action :authenticate_user!

	before_action :set_participant, only: [:show]

	def index
		@participants = User.all
		respond_with(@participants)
	end

	def show
		@social = check_accounts
		respond_with(@participant)
	end

	private

	# Check if there are any social accounts
	def check_accounts
		( @participant.facebook_account != nil && @participant.facebook_account != "" ) ||
		( @participant.twitter_account != nil && @participant.twitter_account != "" ) ||
		( @participant.github_account != nil && @participant.github_account != "" ) ||
		( @participant.google_plus_account != nil && @participant.google_plus_account != "" )
	end


	def hall_of_fame
		@participants = User.select('badges.*, count(badges.id) as badges_count')
											.join(:badges).group('badges.id')
											.having('badges_count > 0').order('badges_count DESC')
	end

	def set_participant
		@participant = User.where(username: params[:username]).first
	end

	def user_params
		params.require(:participant).permit(:username, :email)
	end
end
