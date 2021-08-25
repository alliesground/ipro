class V1::ApiController < ApplicationController
  rescue_from ActiveRecord::RecordInvalid do |e|
    render json: {message: e.message}, status: :unprocessable_entity
  end

  private

  def current_user
    User.find_by_token(auth_token)
  end

  def authenticate
    unless User.exists?(token: auth_token)
      render json: {status: :unauthorized}
      return
    end
  end

  def auth_token
    request.headers[:Authorization]&.split()&.last
  end
end
