#!/usr/bin/env ruby
require 'twitter'
require './lib/module.rb'
require './lib/bot_class.rb'
require 'dotenv'
Dotenv.load

bot = ImpostorBot.new
bot.streaming
