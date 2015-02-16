STDIN.read.split("\n").each do |a|
	`rake sei:organizer[#{a}] RAILS_ENV="production"`
end
