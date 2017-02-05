require_relative '../colors'

namespace :sei do
  desc "Mark a existing user as a badge manager."

  task :add_badge_manager, [:username] => [:environment] do |t, args|
    username = args[:username]

    if username == nil
      printf("[%sERROR%s] You must specify the user's username...",
        Colors::RED, Colors::RESET)
    else
      user  = User.find_by(username: username)

      if user.is_badge_manager
        printf("[%sERROR%s] User #{username} is already a Badge Manager...",
          Colors::RED, Colors::RESET)
      else
        user.update_attribute(:is_badge_manager, true)
        printf("[%sSUCCESS%s] User #{username} is now a Badge Manager.",
          Colors::GREEN, Colors::RESET)
      end
    end
  end

end
