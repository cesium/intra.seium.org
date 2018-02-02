namespace :sei do
  desc "Add badges specified in a JSON document"

  task :add_badges, [:badges_filename] => [:environment] do |tasks, args|
    badges_file = open(args.badges_filename)
    jbadges = JSON.parse(badges_file.read)

    jbadges.each do |jb|
      unless Badge.where(codename: jb["codename"]).empty?
        puts "Badge '#{jb["codename"]}' already exists" 
        next
      end

      is_code_needed = BadgeType::CODE_NEEDED == jb["badge_type"]
      avatar = File.new(jb["avatar"])
      parent = Badge.where(codename: jb["parent"]).first
      parent_id = parent ? parent.id : nil

      Badge.create(name: jb["name"], 
                   codename: jb["codename"], 
                   description: jb["description"], 
                   edition_id: jb["edition"],
                   badge_type: jb["badge_type"],
                   parent_id: parent_id,
                   avatar: avatar,
                   is_code_needed: is_code_needed)

      puts "Added '#{jb["codename"]}'"
    end
  end
end
