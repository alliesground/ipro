class V1::SubscriptionsController < V1::ApiController
  before_action :authenticate, only: [:create]
  before_action :set_product, only: [:create]
  before_action :set_price, only: [:create]
  before_action :create_stripe_payment_method, only: [:create]
  before_action :attach_stripe_payment_method_to_customer, only: [:create]
  before_action :add_stripe_default_payment_method_for_customer, only: [:create]
  before_action :create_stripe_subscription, only: [:create]

  def create
    subscription = Subscription.create!(
      user_id: current_user.id,
      product_id: @product.id,
      price_id: @price.id
    )

    render json: subscription, status: :created
  end
 
  private

  def set_product
    @product = Product.find_by(id: subscription_params[:product_id])
  end

  def set_price
    @price = Price.find_by(id: subscription_params[:price_id])
  end

  def create_stripe_payment_method
    @stripe_payment_method = Stripe::PaymentMethod.create({
      type: 'card',
      card: {
        number: subscription_params.dig(:card, :number) || '4000000360000006',
        exp_month: subscription_params.dig(:card, :exp_month) || 8,
        exp_year: subscription_params.dig(:card, :exp_year) || 2022,
        cvc: subscription_params.dig(:card, :cvc) || '314',
      },
    })
  end

  def attach_stripe_payment_method_to_customer
    Stripe::PaymentMethod.attach(
      @stripe_payment_method.id,
      {
        customer: current_user.stripe_customer_id
      }
    )
  end

  def add_stripe_default_payment_method_for_customer
    Stripe::Customer.update(
      current_user.stripe_customer_id,
      {
        invoice_settings: {
          default_payment_method: @stripe_payment_method
        }
      }
    )
  end

  def create_stripe_subscription
    Stripe::Subscription.create({ 
      customer: current_user.stripe_customer_id,
      items: [{
        price: @price.stripe_id
      }]
    })
  end

  def subscription_params
    params.require(:subscription).permit(
      :product_id,
      :price_id,
      :card => [:number, :exp_month, :exp_year, :cvc]
    )
  end
end
