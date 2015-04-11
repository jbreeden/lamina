require 'sinatra'

# Serve the index.html file when '/' is hit
get '/' do
  send_file "#{settings.public_folder}/index.html"
end

Thread.new do
  $stdin.read
  exit
end
