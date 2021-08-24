class V1::ApiController < ApplicationController
  rescue_from ActiveRecord::RecordInvalid do |e|
    render json: {message: e.message}, status: :unprocessable_entity
  end
end
