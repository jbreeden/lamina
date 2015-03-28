require 'sinatra'

Thread.new do
  File.open(".lamina", "r") do |lock_file|
    lock_file.flock(File::LOCK_EX)
    exit
  end
end

get '/' do
  send_file "#{settings.public_folder}/index.html"
end
