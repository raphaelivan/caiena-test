require 'rails_helper'

RSpec.describe "Weathers Controller", type: :request do
  describe 'POST /weath_on_twitter' do      

    it 'returns status code 200 if valid params' do 
      post '/v1/weathers/post_on_twitter', 
        params: { id: '292839398' }

      expect(response).to have_http_status(200)
    end

    it 'returns status code 301 if invalid params ' do 
      post '/v1/weathers/post_on_twitter'
      expect(response).to have_http_status(301)
    end
  end
end
