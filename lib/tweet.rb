require 'twitter'

class Tweet
  def initialize
    @client = Twitter::Streaming::Client.new do |config|
      config.consumer_key        = "6g0sHM9mPApQW2TaNGWWLK0H7"
      config.consumer_secret     = "5gdi8hHFHzov7MLgcxSJEhzt7I76vHnylOy67tuzwnFsMARBht"
      config.access_token        = "5746962-MUBBH5pzAhuVTdEnHdsjbPB9MY31m9z5UJw4r0nbhg"
      config.access_token_secret = "6faj6bQJh3odooEJQrTC9VRXviHjS1a6xYev1ytAAJqqg"
    end
  end

  def search(topics = ["coffee", "tea"])
    @client.filter(track: topics.join(",")) do |object|
      puts object.text if object.is_a?(Twitter::Tweet)
    end
  end
end
