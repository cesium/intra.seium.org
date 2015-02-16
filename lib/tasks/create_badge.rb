namespace :sei do
	desc "Add a Cesium Associate"
	task :associate, [:email, :associate_number]  => :environment  do |t, args|
		raise ArgumentError.new if args.email.blank?

		raise User::UserNotFoundError.new unless user = User.where(email: args.email).first
		raise StandardException, "Error: Already a Cesium Associate" if user.is_cesium_associate

		user.is_cesium_associate = true
		user.cesium_associate_number = 
		user.save!
	end
end
