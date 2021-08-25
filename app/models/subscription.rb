class Subscription < ApplicationRecord
  belongs_to :user
  belongs_to :product
  belongs_to :price

  after_create_commit :create_stripe_subscription

  private

  def create_stripe_subscription
    Stripe::Subscription.create({ 
      customer: user.stripe_customer_id,
      items: [{
        price: price.stripe_id
      }]
    })
  end
end
