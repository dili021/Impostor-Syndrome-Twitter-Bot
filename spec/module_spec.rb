require_relative '../lib/module'
require_relative '../lib/bot_class.rb'

describe InputOutput do
  let(:bot) {ImpostorBot.new}
  let(:input_stream){bot.input_stream}
  describe "streaming" do
    it "is a connection to Twitter's public stream" do
      expect(:input_stream.instance_of?).to eq(Twitter::Streaming::Client)
    end
  end
end