class Api::V1::WeathersController < ApplicationController

  def forecast
    begin
      if valid_params?
        response = Integrations::Weather.new({
          city: params[:city],
          days_count: params[:days_count],
          lang: params['lang'] || 'pt_br'
        }).call

        create_twitter_post(response) if response[:status] == 200
        render json: :twitter_created, status: response[:status]
      else
        render json: { error: 'Você precisa informar uma cidade como parametro. Exemplo: city: Mococa ' }, status: 301
      end
    rescue Exception => error
      render json: { errors: error.as_json }, status: 500
    end
  end

  private
  def create_twitter_post(response)
    msg = parse_twit(response)
    Integrations::Twit.new(msg: msg).call if msg
  end

  def parse_twit(json)
    city = json[:body].dig('city')

    if city
      msg = "Previsão para #{city['name']}: "
      days = parse_days_in_hash(json[:body].dig('list'))

      if days.any?
        days.each{|day, obj| msg << "#{day} temp. de #{obj[:tmp]}°C com #{obj[:weather]}; " }
      end

      return msg
    end
  end

  def parse_days_in_hash(list)
    days = {}

    if list
      list.map do |d|
        date = Time.at(d['dt']).to_datetime.strftime("%d-%m")
        unless days[date]
          weather = d['weather'].first['description']
          days[date] = { tmp: d['main']['temp'].round(0), weather: weather }
        end
      end
    end
    days
  end

  def valid_params?
    !params[:city].blank? or !params[:lat].blank?
  end
end