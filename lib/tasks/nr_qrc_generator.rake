require 'fileutils'

namespace :sei do
  desc "Generate QRCodes for Badges (Does not consider condes that were not used)."
  task :nr_qrc_generator, [:badge_codename, :num, :code_type]  => :environment  do |t, args|
    raise ArgumentError.new if args.badge_codename.blank? || (args.num.blank? || !(args.num.match /\A\d+\z/)) || (args.code_type.blank? || !(args.code_type.match /\A(SU)|(MU)\z/))

    raise Badge::BadgeNotFoundError.new unless badge = Badge.where(codename: args.badge_codename).first
    #		raise Badge::CodesNotAllowedError.new  unless badge.is_code_needed

    ts = Time.now
    dir = "./tmp/qrcodes/#{ts.year}_#{ts.month}_#{ts.day}_#{ts.hour}_#{ts.min}_#{ts.sec}"
    FileUtils.mkdir_p(dir)

    host = 'intra.seium.org'
    route = '/editions/2016/badges/redeem'

    codes =
      if args.code_type == 'SU'
        badge.generate_codes(args.num.to_i, BadgeCodeStatus::AVAILABLE_FOR_ONE_USE)
        BadgeAcquisition.where(badge_id: badge.id, status: BadgeCodeStatus::AVAILABLE_FOR_ONE_USE)
          .order(created_at: :desc)
          .take(args.num.to_i)
          .map { |ba| ba.code }
      else
        badge.generate_codes(1, BadgeCodeStatus::AVAILABLE_FOR_MULTIPLE_USES) unless BadgeAcquisition.has_any_multiple_use_code?(badge)
        [BadgeAcquisition.get_multiple_use_code(badge)]
      end

    codes.each do |code|
      qr = RQRCode::QRCode.new("#{host}#{route}/#{code}", size: 8, level: :h)
      png = qr.to_img
      png.resize(90, 90).save("#{dir}/#{badge.codename}_#{code}.png")
    end

    puts badge.name
    codes.each { |code| puts code }
  end
end
