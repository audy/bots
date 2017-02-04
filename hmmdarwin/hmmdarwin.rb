require 'bundler'
Bundler.require

MODEL = Ebooks::Model.load('model/corpus.model')

TWEET_CHANCE = 1 # out of 100

class HMMDarwin < Ebooks::Bot
  # Configuration here applies to all MyBots
  def configure
    # Consumer details come from registering an app at https://dev.twitter.com/
    # Once you have consumer details, use "ebooks auth" for new access tokens
    self.consumer_key = ENV['CONSUMER_KEY'] '' # Your app consumer key
    self.consumer_secret = ENV['CONSUMER_SECRET'] # Your app consumer secret

    # Range in seconds to randomize delay when bot.delay is called
    self.delay_range = 1..6
  end

  def on_startup
    # tweet every hour
    scheduler.every '1h' do
      tweet MODEL.make_statement(140)
    end
  end

  # follow back followers
  def on_follow(user)
    follow(user.screen_name)
  end

  # (rarely) respond to tweets ???
  def on_timeline(tweet)
  end

  # respond to mentions with a response seeded with text from the mention
  def on_mention(tweet)
    txt = tweet.text.split[1..-1].join(' ')
    response = MODEL.make_response(txt, 100)
    reply(tweet, response)
  end
end
