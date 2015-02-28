# TODO: Experimental. Truly awful at the moment.
# Cannot find reliable method to deal with Windows task bar.

require 'fileutils'
require 'erb'
require 'securerandom'

windres_template = <<EOF
aaaa ICON "<%= icon %>"
EOF

path = "C:/projects/rb-chrome/bin"
icon = "#{File.dirname(__FILE__)}/../samples/sinatra/public/favicon.ico"
command = "rubyw ../../bin/rb-chrome.rb"
exe = "todo.exe"

c_renderer = ERB.new(File.read("#{File.dirname(__FILE__)}/../lib/launcher/main.erb.c"))
windres_renderer = ERB.new(windres_template)

dir = ".mk-launcher#{SecureRandom.hex(10)}"

Dir.mkdir dir
File.open("#{dir}/main.c", "w") { |f| f.write c_renderer.result binding }
File.open("#{dir}/resources.rc", "w") { |f| f.write windres_renderer.result binding }
FileUtils.cp icon, "#{dir}/#{File.basename(icon)}"
system "windres -i #{dir}/resources.rc -o #{dir}/resources.o"
system "g++ -o #{dir}/#{exe} #{dir}/main.c #{dir}/resources.o"
FileUtils.cp "#{dir}/#{exe}", "#{File.dirname(__FILE__)}/../samples/sinatra/#{exe}"
FileUtils.rm_rf dir
