require 'sinatra'

enable :run
set :port, $RB_CHROME_OPTIONS[:port]

get '/' do
  send_file "#{settings.public_folder}/index.html"
end
