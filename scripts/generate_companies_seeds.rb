require 'json'

puts "[INFO] Script that parses 'sei.js' file and generates a rails seed file for Companies"

sei_js_file = ARGV.first
puts "[LOG] 'sei.js' File: #{sei_js_file}"

companies_js_tmp_file = "._companies_js_tmp_file.js"
companies_json_file = "db/seeds_files/companies/companies.json"

f_tmp = File.open(companies_js_tmp_file, "w")
f_tmp.puts(File.open(sei_js_file).read.match(/var speakers =[^;]*;/)[0] << "\nconsole.log(JSON.stringify(speakers));")
f_tmp.close

speakers = []
companies = {}

puts "[LOG] node < #{companies_js_tmp_file} > #{companies_json_file}"
`node < #{companies_js_tmp_file} > #{companies_json_file}`

File.open(companies_json_file) do |f|
	json_str = ''

	f.each_line do |l|
		json_str << l
	end

	speakers = JSON.parse(json_str)
end

speakers.each do |s|
	s['enterprise'].each do |e|
		if !companies.has_key? e['name']
			companies[e['name']] = e
		end
	end	
end

companies_seeds_file = 'tmp/companies.rb'

File.open(companies_seeds_file, "w") do |f|
	f.puts 'module Seed'
	f.puts '	def self.companies(editions)'
	f.puts '		Company.create!(['

	i = 0
	companies.each_key do |c|
		f.puts '			{'
		f.puts "				name: \"#{companies[c]['name']}\","
		f.puts "				description: nil,"
		f.puts "				is_partner: false,"
		f.puts "				partnership_type: nil,"
		f.puts "				web_site: \"#{companies[c]['enterpriseUrl']}\","
		f.puts "				editions: [editions[0]]"
		f.puts "			}#{',' if i < companies.each_key.size - 1 }"
		i = i + 1
	end

	f.puts '		])'
	f.puts '	end'
	f.puts 'end'
end

puts "[LOG] Companies Seed File Written to: #{companies_seeds_file}"

`rm #{companies_js_tmp_file}`
