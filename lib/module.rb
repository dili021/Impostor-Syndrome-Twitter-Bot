require 'twitter'

module InputOutput
  include Twitter
  def streaming
    input_stream = Twitter::Streaming::Client.new(@keys)
    input_stream.filter(track: @keyword) do |target|
      p "impostor syndrome detected"
      poster = target.user.screen_name
      tweet = target.text
      tweet_id = target.id
      reply(poster, tweet, tweet_id)
      sleep 2
      retweet(tweet_id)
    end
  end
  def reply(poster, tweet, tweet_id)
    post = Twitter::REST::Client.new(@keys)
    post.update("@#{poster} feeling that way is a sign that you are pushing yourself to your limits and growing. Keep it up!", in_reply_to_tweet: tweet_id)
    puts "Posted in reply to: #{tweet} by @#{poster} with an ID of: #{tweet_id}"
  end
  def retweet(tweet_id)
    post = Twitter::REST::Client.new(@keys)
    post.retweet(tweet_id)   
    puts "rewteeted" 
  end
end
