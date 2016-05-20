require 'rspotify'
# for environment variables
require 'dotenv'
RSpotify.authenticate(ENV["SPOTIFY_CLIENT_ID"], ENV["SPOTIFY_CLIENT_SECRET"])

class Music
# need to go into [suggestions] and then grab out music id and type.
# you need the combination of both.
# put together some logic to handle the search
# collect them somewhere (put into an array)  
  def self.charles_api_hash(suggestion_hash)
    music = []
    suggestion_hash.each do |suggestion|
      if "artist" == suggestion["music_type"]
        music << RSpotify::Artist.find(suggestion["music_id"])
      elsif "track" == suggestion["music_type"]
        music << RSpotify::Track.find(suggestion["music_id"])
      elsif "album" == suggestion["music_type"]
        music << RSpotify::Album.find(suggestion["music_id"])
      end
    end
    music
  end
end
