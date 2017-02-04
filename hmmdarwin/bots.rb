require './hmmdarwin.rb'

HMMDarwin.new('hmmdarwin') do |bot|
  bot.consumer_key = ENV['CONSUMER_KEY']
  bot.consumer_secret = ENV['CONSUMER_SECRET']
end
