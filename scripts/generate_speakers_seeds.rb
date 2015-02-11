require 'json'

puts "[INFO] Script that parses 'sei.js' file and generates a rails seed file for Speakers"

speakers_js_file = ARGV.first
puts "[LOG] Speakers Json File: #{speakers_js_file}"

speakers_js_tmp_file = "/tmp/speakers_js_tmp_file"
speakers_json_file = "db/seeds_files/speakers/speakers.json"

f_tmp = File.open(speakers_js_tmp_file, "w")
f_tmp.puts(File.open(speakers_js_file).read.match(/var speakers =[^;]*;/)[0] << "\nconsole.log(JSON.stringify(speakers));")
f_tmp.close

speakers = []

puts "[LOG] node < #{speakers_js_file} > #{speakers_json_file}"
`node < #{speakers_js_tmp_file} > #{speakers_json_file}`

File.open(speakers_json_file) do |f|
	json_str = ''

	f.each_line do |l|
		json_str << l
	end

	speakers = JSON.parse(json_str)
end

speakers_seeds_file = 'tmp/speakers.rb'

File.open(speakers_seeds_file, "w") do |f|
	f.puts 'module Seed'
	f.puts '	def self.speakers(editions, companies)'
	f.puts '		Speaker.create!(['

	speakers.each_with_index do |s, i|
		f.puts '			{'
		f.puts "				name: \"#{s['name']}\","
		f.puts "				role: \"#{s['position']}\","
		f.puts "				biography: \"#{s['about']}\","
		f.puts "				photo_url: \"#{s['pic']}\","
		f.puts "				web_site: \"#{s['web']}\","
		f.puts "				twitter_account: \"#{s['twitter']}\","
		f.puts "				github_account: \"#{s['github']}\","
		f.puts "				company: nil,"
		f.puts "				editions: [editions[0]]"
		f.puts "			}#{',' if i < speakers.size-1 }"
	end

	f.puts '		])'
	f.puts '	end'
	f.puts 'end'
end

puts "[LOG] Speakers Seed File Written to: #{speakers_seeds_file}"
