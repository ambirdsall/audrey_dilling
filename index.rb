require 'sinatra'
require_relative 'noisefinder'

get '/' do
  stories_with_image = Noisefinder.last_five_stories.select do |e|
    e.image
  end.take(4)

  haml :index, :locals => {:stories_with_image => stories_with_image}
end

get '/sounds' do
  track_ids = Noisefinder.last_five_tracks.map(&:id)
  stories = Noisefinder.last_five_stories

  haml :sounds, :locals => {:track_ids => track_ids, :stories => stories}
end
