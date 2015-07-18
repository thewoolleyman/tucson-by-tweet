require_relative '../../lib/tweet'
class HomeController < ApplicationController
  def data
    out = []
    tweets = Tweet.new.search
    tweets.each do |tweet|
      c = tweet.geo.coordinates
      out << {'lat' => "#{c[0]}", 'long' => "#{c[1]}", 'tweet' => tweet.text}
    end
    render json: out.to_json
  end
end
