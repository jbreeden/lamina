require 'sinatra'

enable :run
disable :logging

get '/' do
  send_file "#{settings.public_folder}/index.html"
end
