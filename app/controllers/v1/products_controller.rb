class V1::ProductsController < V1::ApiController
  def index
    products = Product.all
    render json: products, status: :ok
  end
end
