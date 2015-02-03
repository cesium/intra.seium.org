class BadgesController < ApplicationController
	respond_to :html

  before_action :set_badge, only: [:show, :edit, :update, :destroy]

  def index
    @badges = Badge.all
    respond_with(@badges)
  end

  def show
    respond_with(@badge)
  end

	def register
		# DEVISE!!
		user = User.first
		code = params[:code]
		begin
			raise BadgeAcquisition::InvalidCode unless @badge_acq = BadgeAcquisition.where(code: code).first
			BadgeAcquisition.acquire_badge(user, @badge_acq.badge, code)
		rescue StandardError => e
			@error = e
		end
	end

  private
    def set_badge
      @badge = Badge.find(params[:id])
    end

    def badge_params
      params.require(:badge).permit(:name, :description, :code)
    end
end
