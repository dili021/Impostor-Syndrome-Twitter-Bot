require 'twitter'
require 'dotenv'
Dotenv.load

class TwitterBot
  def initialize
    @keyword = "impostor syndrome"
    @keys = {
      consumer_key: ENV['CONSUMER_KEY'],
      consumer_secret: ENV['CONSUMER_SECRET'],
      access_token: ENV['ACCESS_TOKEN'],
      access_token_secret: ENV['ACCESS_TOKEN_SECRET']
    }
  end

  def stream
    @stream_client = Twitter::Streaming::Client.new(@keys)
    @stream_client.filter(track: @keyword) do |object|
      p object.text if object.is_a?(Twitter::Tweet)
      tweet_id = object.id
      user_name = object.user.screen_name
      sleep 1
      reply(tweet_id, user_name)
      sleep 1
      retweet(tweet_id)
    end
  end

  def reply(tweet_id, user_name)
    @post_client = Twitter::REST::Client.new(@keys)
    @message = "feeling that way is a sign that you are pushing yourself to your limits and growing. Keep it up!"
    @post_client.update("@#{user_name} #{@message}", in_reply_to_status_id: tweet_id)
    puts "replied"
  end

  def retweet(tweet_id)
    @post_client = Twitter::REST::Client.new(@keys)
    @post_client.retweet(tweet_id)
    puts "rewteeted" 
  end
end

bot = TwitterBot.new

bot.stream.reply.retweet