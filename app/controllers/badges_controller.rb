class BadgesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_badge, only: [:show]

  def index
    @badges = @edition.badges.order(name: :asc)
    @badge_logos = Badge.logos @edition
    respond_with(@badges)
  end

  def show
    @badge_show_action = true
    respond_with(@badge, @badge_code)
  end

  def require
  end

  def new
    if is_organizer?
      @badge = Badge.new
    else
      redirect_to new_user_session_path
    end
  end

  def create
    image = badge_image

    if Badge.new(badge_params).save
      save_badge_image(image)
      redirect_to edition_badges_path, notice: "Badge added with success."
    else
      redirect_to edition_badges_path, alert: "Error adding badge."
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
      if BadgeAcquisition.has_any_multiple_use_code?(@badge) && is_organizer?
        @badge_code = BadgeAcquisition.get_multiple_use_code(@badge)
      else
        @badge_code = nil
      end
    end

    def badge_params
      params.require(:badge).permit(:name, :codename, :description, :badge_type, :is_code_needed,
        :logo_url, :edition_id)
    end

    def badge_image
      image                       = badge_params[:logo_url]
      params[:badge][:logo_url]   = logo_url(image)
      params[:badge][:edition_id] = @edition.id
      return image
    end

    def save_badge_image(image)
      image_url = Rails.root.join('public/images/badges', @edition.id.to_s.byteslice(2,4),
        image.original_filename)
      File.open(image_url, 'wb') do |file|
        file.write(image.read)
      end
    end

    def logo_url(image)
      image ? "/images/badges/#{@edition.id.to_s.byteslice(2,4)}/#{image.original_filename}" : ""
    end

    def badge_code
      badge = Badge.find(params[:id])
      badge.generate_codes(1, BadgeCodeStatus::AVAILABLE_FOR_MULTIPLE_USES) unless BadgeAcquisition.has_any_multiple_use_code?(badge)
      [BadgeAcquisition.get_multiple_use_code(badge)]
    end
end
