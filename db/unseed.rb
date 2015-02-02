module Unseed
	def self.unseed (confirm)
		if confirm === true
			Activity.delete_all
			BadgeCode.delete_all
			Company.delete_all
			Edition.delete_all
			Speaker.delete_all
			User.delete_all
			Badge.delete_all
		end
	end
end
