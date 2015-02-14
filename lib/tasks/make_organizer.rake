namespace :sei do
	desc "Add a participant to the organization team"
	task :organizer, [:email]  => :environment  do |t, args|
		raise ArgumentError.new if args.email.blank?

		raise User::UserNotFoundError.new unless user = User.where(email: args.email).first
		raise User::UserIsAlreadyAnOrganizerError if user.is_organizer

		user.is_organizer = true
		user.save!
	end
end
