require 'rails_helper'

RSpec.describe "Weather Service" do
  describe 'without city information params' do
    it 'should returns status code 301 if havent a city name' do
      response = Integrations::Weather.new({ days_count: 5 }).call
      expect(response[:status]).to eq(301)
    end
  end

  describe 'with invalid params' do
    it 'should returns status eql 200' do
      response = Integrations::Weather.new({ city: 'Monte Santo de Minas'}).call
      expect(response[:status]).to eq(200)
    end

    it 'should returns the forecast from city ' do
      response = Integrations::Weather.new({ city: 'Monte Santo de Minas'}).call
      expect(response[:body]['list'].any?).to eq(true)
    end
  end

  describe 'with days_count params' do
    it 'should returns only the amount informed in days_count ' do
      response = Integrations::Weather.new({ city: 'Monte Santo de Minas', days_count: 1}).call
      expect(response[:body]['cnt']).to eq(1)
      expect(response[:body]['list'].length).to eq(1)
    end
  end
end