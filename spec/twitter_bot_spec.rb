require_relative '../lib/twitter_bot.rb'

describe TwitterBot do
  let(:bot) { TwitterBot.new }

  describe '#initialize' do
    it 'initializes an instance of twitterbot' do
      expect(bot.instance_of?(TwitterBot)).to be(true)
    end
    it 'raises an error when called but already initialized' do
      expect { TwitterBot.send :initialize }.to raise_error(TypeError)
    end
  end

  describe '#stream' do
    it 'is a private method of the TwitterBot' do
      expect { stream }.to raise_error(NameError)
    end
  end
  describe '#reply' do
    it 'takes a username and the ID of a tweet as arguments' do
      expect { bot.reply }.to raise_error(ArgumentError)
    end
  end

  describe '#retweet' do
    it 'takes the tweet ID as an argument' do
      expect { bot.retweet }.to raise_error(ArgumentError)
    end
  end
end
