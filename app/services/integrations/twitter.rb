require 'twitter'

module Integrations
  class Twitter
    def initialize(params = {current: nil} )
      @params = params
      @client = initilialize_config
    end

    def call
      begin
        if !@params[:current].nil? && create_post
          render_success
        else
          render_invalid_error
        end  
      rescue Exception => errors 
        return { status: 500, body: errors }
      end
    end


    private
    def create_post
      @client.update(parse_msg)
    end    

    def parse_msg      
      "It's raining..."
    end

    def initilialize_config
      Twitter::REST::Client.new do |config|
        config.consumer_key        = ENV.fetch('TWITTER_CONSUMER_KEY')
        config.consumer_secret     = ENV.fetch("TWITTER_CONSUMER_SECRET")
        config.access_token        = ENV.fetch("TWITTER_ACCESS_TOKEN")
        config.access_token_secret = ENV.fetch("TWITTER_ACCESS_SECRET")
      end
    end

    def render_success
      { status: 200, body: :twitter_created }
    end

    def render_invalid_error
      { status: 301, body: 'PostNotCreated' }      
    end
  end
end