require 'sinatra'
require_relative 'noisefinder'

get '/' do
  haml :index
end

get '/sounds' do
  track_ids = Noisefinder.last_five_tracks.map(&:id)
  stories = Noisefinder.last_five_stories

  haml :sounds, :locals => {:track_ids => track_ids, :stories => stories}
end
