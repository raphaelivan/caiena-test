module Integrations
  class Weather
    def initialize(params)
      @params = params
      @client = initilialize_config
    end

    def call
      begin
        if valid_params?
          render_success(get_forecast)
        else
          render_invalid_error
        end  
      rescue Exception => errors 
        return { status: 500, body: errors }
      end
    end

    def get_forecast
      city = get_geocode
      @client.forecast({
        lat: city['lat'], 
        long: city['lon'], 
        days_count: @params[:days_count].to_i || 5
      })
    end

    def get_geocode
      @client.geocode(city: @params[:city])
    end

    def initilialize_config
      Maju::Client.new(lang: @params[:lang], api_token: ENV.fetch('openweather_api_key'))
    end

    private
    def valid_params?
      true
    end

    def render_success(json)
      { status: 200, body: json }
    end

    def render_invalid_error
      { status: 301, body: 'IntegrationsError' }      
    end
  end
end