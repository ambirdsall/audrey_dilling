require 'yaml'
require 'soundcloud'

AUTH_DATA = YAML.load_file("secrets.yml") if File.exist?("secrets.yml")

class Noisefinder
  @@user_id = ENV["AUDREY_SC_USER_ID"] || AUTH_DATA["soundcloud"]["user_id"]
  @@app_id = ENV["SC_APP_ID"] || AUTH_DATA["soundcloud"]["app_id"]
  def self.last_five_tracks
    @_last_five ||= soundcloud_client.get("/users/#{@@user_id}/tracks").last(5)
  end

  protected

  def self.soundcloud_client
    @_client ||= SoundCloud.new({
      :client_id => @@app_id
    })
  end
end
