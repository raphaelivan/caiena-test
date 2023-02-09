Rails.application.routes.draw do

  namespace :api, constraints: { format: :json }, path: '/v1' do
    namespace :v1, path: '/' do
      post 'weathers/post_on_twitter', to: 'weathers#post_on_twitter'
    end
  end
end
