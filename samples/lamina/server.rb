require 'sinatra'

Thread.new do
  if File.exists? "lamina.lock"
    puts "Found lock file"
    File.open("lamina.lock", "r") do |lock_file|
      while !lock_file.flock(File::LOCK_EX | File::LOCK_NB)
        sleep 1
      end
      exit
    end
  else
    puts "No browser running."
  end
end

get '/' do
  "Hell, Lamina!"
end
