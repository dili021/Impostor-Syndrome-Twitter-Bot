#!/usr/bin/env ruby
require_relative './lib/twitter_bot.rb'
require 'twitter'
require 'dotenv'
Dotenv.load

bot = TwitterBot.new

bot.stream.reply.retweet
