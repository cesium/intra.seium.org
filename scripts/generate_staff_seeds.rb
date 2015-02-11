require 'json'

puts "[INFO] Script that parses 'sei.js' file and generates a rails seed file for Users (Staff)"

staff_js_file = ARGV.first
puts "[LOG] Staff Json File: #{staff_js_file}"

staff_js_tmp_file = "/tmp/staff_js_tmp_file.js"
staff_json_file = "db/seeds_files/users/staff.json"

f_tmp = File.open(staff_js_tmp_file, "w")
f_tmp.puts(File.open(staff_js_file).read.match(/var staffs=[^;]*;/)[0] << "\nconsole.log(JSON.stringify(staffs));")
f_tmp.close

staff = []

puts "[LOG] node < #{staff_js_tmp_file} > #{staff_json_file}"
`node < #{staff_js_tmp_file} > #{staff_json_file}`

File.open(staff_json_file) do |f|
	json_str = ''

	f.each_line do |l|
		json_str << l
	end

	staff = JSON.parse(json_str)
end

staff_seeds_file = 'tmp/staff.rb'

File.open(staff_seeds_file, "w") do |f|
	f.puts 'module Seed'
	f.puts '	def self.staff(editions, activities)'
	f.puts '		User.create!(['

	staff.each_with_index do |s, i|
		f.puts '			{'
		f.puts "				email: I18n.transliterate('#{s['name']}').downcase.gsub(' ', '') + '@seium.org',"
		f.puts "				password: '123456789',"
		f.puts "				first_name: \"#{s['name'].split[0]}\","
		f.puts "				last_name: \"#{s['name'].split[1]}\","
		f.puts "				sex: UserSex::UNDEFINED,"
		f.puts "				username: I18n.transliterate('#{s['name']}').downcase.gsub(' ', ''),"
		f.puts "				avatar: File.open(\"\#{Rails.root}/public/#{s['pic']}\"),"
		f.puts "				is_univ_student: true,"
		f.puts "				is_student_at_minho_univ: true,"
		f.puts "				minho_univ_student_id: 'a123456',"
		f.puts "				is_inf_eng_student_at_minho_univ: true,"
		f.puts "				is_cesium_associate: true,"
		f.puts "				cesium_associate_number: 0,"
		f.puts "				is_organizer: true,"
		f.puts "				organizer_role: \"#{s['position']}\","
		f.puts "				activities: [],"
		f.puts "				editions: [editions[0]],"
		f.puts "				twitter_account: \"#{s['twitter']}\","
		f.puts "				github_account: \"#{s['github']}\","
		f.puts "				facebook_account: \"#{s['facebook']}\","
		f.puts "				linked_in_account: \"#{s['linkedin']}\","
		f.puts "			}#{',' if i < staff.size-1 }"
	end

	f.puts '		])'
	f.puts '	end'
	f.puts 'end'
end

puts "[LOG] Staff Seed File Written to: #{staff_seeds_file}"
