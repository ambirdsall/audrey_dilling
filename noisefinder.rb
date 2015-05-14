require 'yaml'
require 'soundcloud'
require 'feedjira'

AUTH_DATA = YAML.load_file("secrets.yml") if File.exist?("secrets.yml")
AUDREY_KALW_FEED_URI = "http://kalw.org/feeds/2476/rss.xml"

class Noisefinder
  @@user_id = ENV["AUDREY_SC_USER_ID"] || AUTH_DATA["soundcloud"]["user_id"]
  @@app_id = ENV["SC_APP_ID"] || AUTH_DATA["soundcloud"]["app_id"]

  def self.last_five_tracks
    @_latest_tracks ||= soundcloud_client.get("/users/#{@@user_id}/tracks").last(5)
  end

  def self.last_five_stories
    @_latest_stories ||= Feedjira::Feed.fetch_and_parse(AUDREY_KALW_FEED_URI).entries
  end

  protected

  def self.soundcloud_client
    @_client ||= SoundCloud.new({
      :client_id => @@app_id
    })
  end
end
