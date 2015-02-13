namespace :sei do
	desc "Generate Qrcodes for badges"
	task :qrc_generator, [:badge_codename, :num, :code_type]  => :environment  do |t, args|
		raise ArgumentError.new if args.badge_codename.blank? || (args.num.blank? || !(args.num.match /\A\d+\z/)) || (args.code_type.blank? || !(args.code_type.match /\A(SU)|(MU)\z/))

		raise Badge::BadgeNotFoundError.new unless badge = Badge.where(codename: args.badge_codename).first
		raise Badge::CodesNotAllowedError.new  unless badge.is_code_needed

		dir = './tmp'

		if args.code_type == 'SU'
			badge.generate_codes(args.num.to_i - BadgeAcquisition.number_available_codes_for_one_use(badge), BadgeCodeStatus::AVAILABLE_FOR_ONE_USE)	
		else
			badge.generate_codes(1, BadgeCodeStatus::AVAILABLE_FOR_MULTIPLE_USES) unless BadgeAcquisition.has_any_multiple_use_code?(badge)
		end

		codes =
			if args.code_type == 'SU'
				BadgeAcquisition.get_available_codes_for_one_use(badge).take args.num.to_i
			else
				[BadgeAcquisition.get_multiple_use_code(badge)]
			end

		puts codes.to_s
	end
end
