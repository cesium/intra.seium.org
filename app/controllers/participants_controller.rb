class ParticipantsController < ApplicationController
	before_action :set_participant, only: [:show]
	before_action :set_edition

	def index
		@participants = @edition.users.map { |u| u.public_profile }
		respond_with(@participants)
	end

	def show
		respond_with(@participant)
	end

	private

	def set_participant
		@participant = User.where(username: params[:username]).first.public_profile
	end

	def set_edition
		@edition = Edition.find params[:edition_id]
	end

	def user_params
		params.require(:participant).permit(:username)
	end
end
