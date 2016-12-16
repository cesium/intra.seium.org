require_relative '../colors'

namespace :sei do
  desc "Mark a existing user as organizer."

  task :add_organizer, [:username] => [:environment] do |t, args|
    username = args[:username]

    if username == nil
      printf("[%sERROR%s] You must specify the user's username...",
        Colors::RED, Colors::RESET)
    else
      user  = User.find_by(username: username)

      if user.is_organizer
        printf("[%sERROR%s] User #{username} is already an organizer...",
          Colors::RED, Colors::RESET)
      else
        user.update_attribute(:is_organizer, true)
        printf("[%sSUCCESS%s] User #{username} is now an organizer.",
          Colors::GREEN, Colors::RESET)
      end
    end
  end

end
