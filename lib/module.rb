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
      retweet(poster, tweet, tweet_id)
    end
  end
  def reply(poster, tweet, tweet_id)
    post = Twitter::REST::Client.new(@keys)
    post.update("@#{poster} feeling that way is a sign that you are pushing yourself to your limits and growing. Keep it up!", in_reply_to_status_id: tweet_id)
    p "Posted in reply to: #{tweet} by @#{poster} with an ID of: #{tweet_id}"
  end
  def retweet(poster, tweet, tweet_id)
    post = Twitter::REST::Client.new(@keys)
    post.retweet(tweet_id)   
    p "rewteeted \n" 
  end
end
