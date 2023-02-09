require 'rails_helper'

RSpec.describe "Weathers Controller", type: :request do
  describe 'POST /weath_on_twitter' do

    before do
      post '/v1/weathers/post_on_twitter'
    end
      
    it 'returns status code 200 if passing correctly' do 
      expect(response).to have_http_status(200)
    end

    it 'returns status code 304 if passing correctly'
  end
end
