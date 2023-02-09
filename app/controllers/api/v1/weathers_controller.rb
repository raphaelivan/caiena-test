class Api::V1::WeathersController < ApplicationController

	def post_on_twitter
    begin
      if valid_params?
  			response = Integrations::Twitter.new({ current: '29', city: '', nexts: [] }).call
        render json: response[:body], status: response[:status]
      else
        render json: { error: 'Please, ' }, status: 301
      end
    rescue Exception => error
      render json: { errors: error.as_json }, status: 500
    end
	end

  private
  def valid_params?
    !params[:id].blank?
  end
end
