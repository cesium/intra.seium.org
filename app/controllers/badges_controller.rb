class BadgesController < ApplicationController
	before_action :authenticate_user!

  before_action :set_badge, only: [:show]

  def index
    @badges = @edition.badges.order(name: :asc)
    respond_with(@badges)
  end

  def show
		@badge_show_action = true
    respond_with(@badge)
  end

	def require
	end

	def redeem
		code = params[:code]
		@redeem_action = true
		begin
			@badge = BadgeAcquisition.acquire_badge_with_code(current_user, code)
      User.reset_badge_counters(current_user)
		rescue BadgeAcquisition::AcquisitionError => e
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
