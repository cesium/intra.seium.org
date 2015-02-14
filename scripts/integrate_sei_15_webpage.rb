# Must run in the rails root project folder
require 'fileutils'

sei_15_webpage_project = '../SEI15'
dest_folder_name = 'sei_15_webpage'
dest_dir = "public/#{dest_folder_name}"

# Create 'public/sei_15_webpage' folder
FileUtils.mkdir_p(dest_dir) unless Dir.exists? dest_dir

# Copy the project webpage to that location
['index.html', 'css', 'events', 'fonts', 'img', 'js'].each do |f|
	FileUtils.cp_r("#{sei_15_webpage_project}/#{f}", dest_dir)
end

# In index.html, replace 'src="img/' by 'src="/sei_15_webpage/img/'
# In index.html, replace '<link href="' by '<link href="/sei_15_webpage/'
# In index.html, replace '<script src="js/' by '<script src="/sei_15_webpage/js/'

text = File.read("#{dest_dir}/index.html").gsub(/"img/, "\"/#{dest_folder_name}/img")
text.gsub!(/"css/, "\"/#{dest_folder_name}/css")
text.gsub!(/"js/, "\"/#{dest_folder_name}/js")
File.write("#{dest_dir}/index.html", text)

# In 'js/sei.js', replace "'events/" by "'/sei_15_webpage/events/"
# In 'js/sei.js', replace "'img/speakers" by "'/sei_15_webpage/img/speakers"
# In 'js/sei.js', replace "'img/staff" by "'/sei_15_webpage/img/staff"

text = File.read("#{dest_dir}/js/sei.js").gsub(/'events/, "'/#{dest_folder_name}/events")
text.gsub!(/'img\/speakers/, "'/#{dest_folder_name}/img/speakers")
text.gsub!(/'img\/staff/, "'/#{dest_folder_name}/img/staff")
File.write("#{dest_dir}/js/sei.js", text)

# In 'events/*.html', replace '"img/' by '"/sei_15_webpage/img/'

Dir.glob("#{dest_dir}/events/*.html") do |f|
	text = File.read(f).gsub(/"img\//, "\"/#{dest_folder_name}/img/")
	File.write(f, text)
end
