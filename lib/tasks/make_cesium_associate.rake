namespace :sei do
	desc "Create Badge"
	task :ass, [:email, :associate_number]  => :environment  do |t, args|
		raise ArgumentError.new if args.email.blank?

		raise User::UserNotFoundError.new unless user = User.where(email: args.email).first
		raise StandardException, "Error: Already a Cesium Associate" if user.is_cesium_associate

		user.is_cesium_associate = true
		user.cesium_associate_number = args.associate_number.to_i if !args.associate_number.blank?
		user.save!
	end
end
