module Integrations
  class Weather
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
    def render_success
      { status: 200, body: :twitter_created }
    end

    def render_invalid_error
      { status: 301, body: 'IntegrationsError' }      
    end
  end
end