require 'sinatra'

Thread.new do
  if File.exists? ".lamina"
    File.open(".lamina", "r") do |lock_file|
      while !lock_file.flock(File::LOCK_EX | File::LOCK_NB)
        sleep 1
      end
      lock_file.flock(File::LOCK_UN)
      exit
    end
  else
    puts "No browser running."
  end
end

get '/' do
  send_file "#{settings.public_folder}/index.html"
end
