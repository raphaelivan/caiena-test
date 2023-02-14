require 'rails_helper'

RSpec.describe "Weathers Controller", type: :request do
  describe 'POST /forecast' do
    before do
      @params = { city: 'Monte Santo de Minas', days_count: 5 }
    end      

    it 'returns status code 200 if valid params' do 
      post '/v1/weathers/forecast', 
        params: @params

      expect(response).to have_http_status(200)
    end

    it 'returns msg twitter_is_created ' do 
      post '/v1/weathers/forecast', 
        params: @params

      expect(JSON.parse(response.body)).to eq("twitter_created")
    end

    it 'returns status code 301 if invalid params ' do 
      post '/v1/weathers/forecast'
      expect(response).to have_http_status(301)
    end
  end
end
