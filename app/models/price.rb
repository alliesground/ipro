class Price < ApplicationRecord
  belongs_to :product

  after_create_commit :create_stripe_price

  private

  def create_stripe_price
    if product.stripe_id.present?
      Stripe::Price.create({
        unit_amount: base_price_cents,
        product: product.stripe_id,
        currency: 'aud'
      })
    end
  end
end
