require 'twitter'

class Tweet
  def initialize
    @client = Twitter::REST::Client.new do |config|
      config.consumer_key        = "6g0sHM9mPApQW2TaNGWWLK0H7"
      config.consumer_secret     = "5gdi8hHFHzov7MLgcxSJEhzt7I76vHnylOy67tuzwnFsMARBht"
      config.access_token        = "5746962-MUBBH5pzAhuVTdEnHdsjbPB9MY31m9z5UJw4r0nbhg"
      config.access_token_secret = "6faj6bQJh3odooEJQrTC9VRXviHjS1a6xYev1ytAAJqqg"
    end
  end

  def search(topics = ["coffee", "tea"])
    @client.search(topics.join(","), result_type: "recent").take(3).collect do |tweet|
      p tweet.geo
      # "#{tweet.text}"
    end
  end
end
