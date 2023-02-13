class Api::V1::WeathersController < ApplicationController

	def post_on_twitter
    begin
      if valid_params?
        response = create_twitter_post({})
        render json: response[:body], status: response[:status]
      else
        render json: { error: 'Please, ' }, status: 301
      end
    rescue Exception => error
      render json: { errors: error.as_json }, status: 500
    end
	end

  private
  def create_twitter_post(params)
    Integrations::Twit.new({ current: '29', city: '', nexts: [] }).call
  end

  def valid_params? 
    !params[:id].blank?
  end
end
