require 'dotenv'
Dotenv.load

class ImpostorBot
  include InputOutput
  def initialize
    @keys = {
      consumer_key: ENV['CONSUMER_KEY'],
      consumer_secret: ENV['CONSUMER_SECRET'],
      access_token: ENV['ACCESS_TOKEN'],
      access_token_secret: ENV['ACCESS_TOKEN_SECRET']
    }
    @keyword = 'impostor syndrome'
  end
end
