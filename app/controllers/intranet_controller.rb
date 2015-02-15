class IntranetController < ApplicationController
	before_action :set_edition
	before_action :authenticate_user!

	def intranet
		redirect_to edition_participant_path(@edition, current_user).sub(/\d+\z/, current_user.username)
	end

	private

	def set_edition
		@edition =
			if Edition.exists? Time.now.year
				Edition.find(Time.now.year)
			else
				Edition.find(2015)
			end
	end
end
