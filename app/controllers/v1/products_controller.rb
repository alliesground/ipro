class V1::ProductsController < V1::ApiController
  def index
    products = Product.all
    render json: products.to_json(include: :prices), status: :ok
  end
end
