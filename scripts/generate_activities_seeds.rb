require 'nokogiri'
require 'open-uri'

def det_act_type(str)
	case str
	when 'Palestra'
		"ActivityType::TALK"
	when 'Discussão'
		"ActivityType::DISCUSSION"
	when 'Social'
		"ActivityType::SOCIAL"
	when 'Apresentação'
		"ActivityType::PRESENTATION"
	when 'Workshop'
		"ActivityType::WORKSHOP"
	when 'Concurso'
		"ActivityType::CHALLENGE"
	when 'Lounge'
		"ActivityType::LOUNGE"
	else
		"ActivityType::OTHER"
	end
end

act_folder = ARGV.first
puts "[LOG] Html Activites folder: #{act_folder}"

year = 2015
month = 2

activities = []

Dir.glob("#{act_folder}/*.html") do |act_file|
	puts "[LOG] Html File: #{act_file}"
	
	day = act_file.match(/\d+-fev\.html$/)[0].to_i

	Nokogiri::HTML(open(act_file), nil, 'UTF-8').css('.event-title').each do |act_tit_node|
		act_node = act_tit_node.parent
		act_node.css('.event-description').first.css('p').first.remove
		location_str = act_node.css('.event-location').first.content
		act = {
			name: act_node.css('.event-title').first.content,
			description: act_node.css('.event-description').first.content.strip.tr("'", " "),
			begin_date: Time.new(year, month, day, location_str.split('-')[0].strip.split('h')[0].to_i, location_str.split('-')[0].strip.split('h')[1].to_i),
			activity_type: det_act_type(act_node.css('.event-type').first.content),
			place: (location_str.split('-')[1].strip if location_str.split('-')[1]),
			speakers: nil,
			edition: nil
		}
		activities << act
	end
end

File.open('tmp/activities.rb', "w") do |f|
	f.puts 'module Seed'
	f.puts '	def self.activities(editions, speakers)'
	f.puts '		Activity.create!(['

	activities.each_with_index do |a, i|
		f.puts '			{'
		f.puts "				name: \'#{a[:name]}\',"
		f.puts "				description: '#{a[:description]}',"
		f.puts "				begin_date: DateTime.civil_from_format(:local, #{year}, #{month}, #{a[:begin_date].day}, #{a[:begin_date].hour}, #{a[:begin_date].min}),"
		f.puts "				activity_type: #{a[:activity_type]},"
		f.puts "				place: '#{a[:place]}',"
		f.puts "				speakers: [],"
		f.puts "				edition: editions[0]"
		f.puts "			}#{',' if i < activities.size-1 }"
	end

	f.puts '		])'
	f.puts '	end'
	f.puts 'end'
end
