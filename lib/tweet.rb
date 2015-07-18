require 'twitter'
require 'json'

class Tweet
  def initialize
    @client = Twitter::REST::Client.new do |config|
      config.consumer_key        = "6g0sHM9mPApQW2TaNGWWLK0H7"
      config.consumer_secret     = "5gdi8hHFHzov7MLgcxSJEhzt7I76vHnylOy67tuzwnFsMARBht"
      config.access_token        = "5746962-MUBBH5pzAhuVTdEnHdsjbPB9MY31m9z5UJw4r0nbhg"
      config.access_token_secret = "6faj6bQJh3odooEJQrTC9VRXviHjS1a6xYev1ytAAJqqg"
    end
  end

  def search(topics = ["tucson"])
    out = []

    options = {
      geocode: "#{latitude},#{longitude},#{3000}mi",
      result_type: 'recent',
    }

    @client.search(topics.join(","), options).take(30000).collect do |tweet|
      out << tweet
    end
    out
  end


  def latitude
    tucson = '32.3083008'
    nyc = '40.7127'
    ENV['latitude'] || nyc
  end

  def longitude
    tucson = '-110.9264'
    nyc = '-74.0059'
    ENV['latitude'] || nyc
  end

  def radius_of_earth
    12450
  end

end
