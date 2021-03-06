class Product < ApplicationRecord
  has_many :prices, dependent: :destroy
  has_many :subscriptions
  has_many :users, through: :subscriptions

  after_create_commit :create_stripe_product

  private

  def create_stripe_product
    stripe_product = Stripe::Product.create({
      name: name
    })

    update({stripe_id: stripe_product.id})
  end
end
