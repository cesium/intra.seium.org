Dir[File.dirname(__FILE__) + "/seeds_files/*.rb"].each { |file| require_relative file }

# Editions
editions = Seed::editions
