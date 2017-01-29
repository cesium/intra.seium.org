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

  def new
    if user_signed_in? && current_user.is_organizer
      @badge = Badge.new
    else
      redirect_to new_user_session_path
    end
  end

  def create
    # Set badge edition_id to the current edition id.
    params[:badge][:edition_id] = @edition.id

    if Badge.new(badge_params).save
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

  def codes
    codename        = badge_codes_params[:codename]
    @codename       = badge_codes_params[:codename]
    @url            = "http://s3.eu-west-2.amazonaws.com/sei17-intra-assets/qrcodes/"
    number_of_codes = badge_codes_params[:number_of_codes].to_i
    host            = 'intra.seium.org'
		route           = '/editions/2017/badges/redeem'
    s3              = AWS::S3.new
		folder          = Rails.root.join('public', 'uploads', 'qrcodes')
		FileUtils.mkdir_p(folder)


    badge = Badge.find_by(codename: codename)
    badge.generate_codes(number_of_codes - BadgeAcquisition.number_available_codes_for_one_use(badge), BadgeCodeStatus::AVAILABLE_FOR_ONE_USE)

    # Generate badge code and corresponding QRCodes.
    codes = BadgeAcquisition.get_available_codes_for_one_use(badge).take(number_of_codes)
    @codes = codes
    codes.each do |code|
			qr          = RQRCode::QRCode.new("#{host}#{route}/#{code}", size: 8, level: :h)
			png         = qr.to_img
      filename    = folder.join("#{codename}_#{code}.png")
      dest_path   = "qrcodes/#{codename}_#{code}.png"
			png.resize(400, 400).save(filename)
      obj = s3.buckets[ENV.fetch("S3_BUCKET_NAME")].objects[dest_path].write(:file => filename)
      obj.acl = :public_read
    end
  end

  private
    def set_badge
      @badge = Badge.find(params[:id])
    end

    def badge_params
      params.require(:badge).permit(:name, :codename, :description, :badge_type, :is_code_needed,
        :edition_id, :avatar)
    end

    def badge_codes_params
      params.permit(:codename, :number_of_codes)
    end
end
