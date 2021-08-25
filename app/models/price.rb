class Price < ApplicationRecord
  belongs_to :product

  after_create_commit :create_stripe_price

  private

  def create_stripe_price
    return unless product.stripe_id.present?
    
    stripe_price = Stripe::Price.create({
      unit_amount: base_price_cents,
      product: product.stripe_id,
      currency: 'aud',
      recurring: {interval: 'month'}
    })

    update({stripe_id: stripe_price.id})
  end
end
