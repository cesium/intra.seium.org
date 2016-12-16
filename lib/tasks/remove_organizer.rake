require_relative '../colors'

namespace :sei do
  desc "Remove organizer status from a given user."

  task :remove_organizer, [:username] => [:environment] do |t, args|
    username = args[:username]

    if username == nil
      printf("[%sERROR%s] You must specify the user's username...",
        Colors::RED, Colors::RESET)
    else
      user  = User.find_by(username: username)

      if user.is_organizer
        user.update_attribute(:is_organizer, false)
      printf("[%sSUCCESS%s] User %s is not an organizer anymore.",
        Colors::GREEN, Colors::RESET, username)
      else
        printf("[%sERROR%s] User %s was not an organizer, nothing to be done...",
          Colors::RED, Colors::RESET, username)
      end
    end
  end

end
