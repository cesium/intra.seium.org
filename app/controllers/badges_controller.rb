class BadgesController < ApplicationController
	before_action :authenticate_user!

  before_action :set_badge, only: [:show]

  def index
    @badges       = @edition.badges.order(name: :asc)
    @badge_logos  = Badge.logos @edition
    respond_with(@badges)
  end

  def show
		@badge_show_action = true
    respond_with(@badge)
  end

	def require
	end

  def new
    @badge = Badge.new
  end

  def create
    image     = badge_params[:logo_url]
    logo_url  = Rails.root.join('public/images/badges',
      @edition.id.to_s.byteslice(2,4), image.original_filename)
    params[:badge][:logo_url] =
      "/images/badges/#{@edition.id.to_s.byteslice(2,4)}/#{image.original_filename}"
    @badge = Badge.new(badge_params)
    @badge.save

    if @badge.persisted?
      @badge.update_attribute(:edition_id, @edition.id)
      File.open(logo_url, 'wb') do |file|
        file.write(image.read)
      end
      redirect_to edition_badges_path
    end
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
      params.require(:badge).permit(:name, :codename, :description, :badge_type, :is_code_needed,
        :logo_url)
    end
end
