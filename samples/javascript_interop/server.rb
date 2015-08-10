require 'sinatra'

get '/' do
  send_file "#{settings.public_folder}/index.html"
end

Thread.new do
  $stdin.read
  Sinatra::Application.quit!
end
