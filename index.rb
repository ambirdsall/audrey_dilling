require 'sinatra'
require_relative 'noisefinder'

get '/' do
  haml :index
end

get '/sounds' do
  track_ids = Noisefinder.last_five_tracks.map(&:id)

  haml :sounds, :locals => {:track_ids => track_ids}
end
