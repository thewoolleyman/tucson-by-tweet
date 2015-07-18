require_relative '../lib/assets/tweet'


RSpec.describe Tweet do
  describe "#search" do
    it "returns 0 for an all gutter game" do
      tweet = Tweet.new
       out = tweet.search
      expect(out).to eq(/json/)
    end
  end
end
