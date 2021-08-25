class V1::ProfilesController < V1::ApiController
  before_action :authenticate

  def show
    products = current_user.products
    render json: products.to_json(include: :prices), status: :ok
  end
end
