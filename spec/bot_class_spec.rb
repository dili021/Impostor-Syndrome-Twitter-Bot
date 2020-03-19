require_relative '../lib/bot_class.rb'

describe ImpostorBot do
  let(:bot) {ImpostorBot.new}
  
  describe "initialize" do
    it "initializes an instance of impostorbot" do
      expect(bot.instance_of?(ImpostorBot)).to be(true)
    end
    it "raises an error when called but already initialized" do
      expect{ImpostorBot.send :initialize}.to raise_error(TypeError)
    end
  end

end
