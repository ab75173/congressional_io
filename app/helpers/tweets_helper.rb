module TweetsHelper

  def get_tweets(handle)
    require 'twitter'

    @client = Twitter::REST::Client.new do |config|
      config.consumer_key       = 'HFJtymOEjQ6mc9FASGDXyp2KS'
      config.consumer_secret    = 'wZAVQLDSIVyoiogZn1owCIs0inuryp6whAtl6BdzTHcaQx4f93'
      config.access_token        = '300381691-gTe1rOB3UxjtaaP0WBoACcIUXj5mt2czfguX0KrB'
      config.access_token_secret = 'Kgp4Z4iojtjXiEQO6n1toHVHtKMS9D44SowfkAJDjL7le'
    end

    return @client.user_timeline(handle)
  end

end
