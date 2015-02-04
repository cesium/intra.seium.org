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

	def require
	end

	def register
		# DEVISE!!
		user = User.first
		code = params[:code]
		begin
			@badge = BadgeAcquisition.acquire_badge_with_code(user, code)
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
