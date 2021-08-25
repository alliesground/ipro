class V1::SubscriptionsController < V1::ApiController
  before_action :authenticate, only: [:create]

  def create
    subscription = Subscription.create!(
      user_id: current_user.id,
      product_id: subscription_params[:product_id]
    )

    render json: subscription, status: :created
  end
 
  private

  def subscription_params
    params.require(:subscription).permit(
      :product_id,
      :price_id
    )
  end
end
