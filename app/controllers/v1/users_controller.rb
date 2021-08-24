class V1::UsersController < V1::ApiController
  def create
    user = User.create!
    render json: user.token, status: :created
  end
end
