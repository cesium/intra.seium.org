class IntranetController < ApplicationController
	before_action :authenticate_user!

	def intranet
		redirect_to edition_participant_path(@edition, current_user).sub(/\d+\z/, current_user.username)
	end
end
