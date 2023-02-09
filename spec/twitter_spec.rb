require 'rails_helper'

RSpec.describe "Twitter Service", type: :request do
  describe 'with valid params' do      
    before do 
      @weather = { current: '29', city: '', nexts: [] }
    end

    it 'returns status code 200 if have a valid message' do       
      response = Integrations::Twitter.new(@weather).call
      expect(response[:status]).to eq(200)
    end

    it 'returns status code 200 if params current is valid' do 
      response = Integrations::Twitter.new(@weather.except(:nexts)).call
      expect(response[:status]).to eq(200)    
    end
  end

  describe 'with invalid params' do      
    it 'returns status code 500 if havent a message' do 
      response = Integrations::Twitter.new.call
      expect(response[:status]).to eq(301)
    end

    it 'returns status code 301 if params current is invalid' do 
      response = Integrations::Twitter.new({ current: nil }).call
      expect(response[:status]).to eq(301)    
    end
  end
end
