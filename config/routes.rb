Rails.application.routes.draw do

  namespace :api, constraints: { format: :json }, path: '/v1' do
    namespace :v1, path: '/' do
      post 'weathers/forecast', to: 'weathers#forecast'
    end
  end
end
