require 'sinatra'

# lamina creates the `.lamina` file on launch, and maintains
# a shared lock until it closes (or is terminated)
# So, as soon as we're able to get an exclusive lock on this file,
# the app is closed and the server should exit too.
Thread.new do
  # Give lamina plenty of time to grab the lock,
  # so the server doesn't exit immediately
  sleep 5
  File.open(".lamina", "r") do |lock_file|
    lock_file.flock(File::LOCK_EX)
    exit
  end
end

# Serve the index.html file when '/' is hit
get '/' do
  send_file "#{settings.public_folder}/index.html"
end
