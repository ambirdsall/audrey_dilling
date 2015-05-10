require 'pry'
require 'yaml'
require 'soundcloud'

AUTH_DATA = YAML.load_file("secrets.yml")

class Noisefinder
  def self.last_five_tracks
    @_last_five ||= soundcloud_client.get("/users/#{AUTH_DATA["aud"]["user_id"]}/tracks").last(5)
  end

  protected

  def self.soundcloud_client
    @_client ||= SoundCloud.new({
      :client_id => AUTH_DATA["soundcloud_auth"]["id"],
    })
  end
end
