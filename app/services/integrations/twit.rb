module Integrations
  class Twit
    def initialize(params)
      @params = params
      @client = initilialize_config
    end

    def call
      begin
        if !@params[:msg].nil? && create_post
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
      @client.update(@params[:msg])
    end    

    def initilialize_config
      Twitter::REST::Client.new do |config|
        config.consumer_key        = ENV.fetch('twitter_consumer_key')
        config.consumer_secret     = ENV.fetch("twitter_consumer_secret")
        config.access_token        = ENV.fetch("twitter_access_token")
        config.access_token_secret = ENV.fetch("twitter_access_token_secret")
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