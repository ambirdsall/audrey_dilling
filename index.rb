require 'sinatra'

get '/' do
  haml :index
end

get '/sounds' do
  haml :sounds
end
