module Integrations
  class Twitter
    def initialize(params = {current: nil} )
      @params = params
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
      msg = parse_msg
    end

    def parse_msg      
      "34°C e nublado em em 12/12. Média para os próximos dias: 32°C em 13/12,
25°C em 14/12, 29°C em 15/12, 33°C em 16/12 e 28°C em 16/12."
    end

    def render_success
      { status: 200, body: :twitter_created }
    end

    def render_invalid_error
      { status: 301, body: 'PostNotCreated' }      
    end
  end
end