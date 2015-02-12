class ParticipantsController < ApplicationController
	before_action :set_edition
	before_action :set_participant, only: [:show]

	def index
		@participants = @edition.users.map { |u| u.public_profile }
		respond_with(@participants)
	end

	def show
		respond_with(@participant)
	end

	def find_by_email
		user = User.where(email: params[:email]).first
		
		if user
			redirect_to edition_participant_path(@edition, user).sub(/\d+$/, user.username)
		else
			redirect_to edition_participants_path(@edition)	
		end
	end

	private

	def set_participant
		@participant = User.where(username: params[:username]).first.public_profile
	end

	def set_edition
		@edition = Edition.find params[:edition_id]
	end

	def user_params
		params.require(:participant).permit(:username, :email)
	end
end
