class User < ApplicationRecord
  before_create :generate_token
  has_many :subscriptions
  has_many :products, through: :subscriptions

  after_create_commit :onboard_stripe_customer

  private

  def generate_token
    loop do
      self.token = SecureRandom.hex
      break unless self.class.exists?(token: token)
    end
  end

  def onboard_stripe_customer
    return if is_admin?
    customer = Stripe::Customer.create({
      description: "New Customer #{id}"
    })

    update({ stripe_customer_id: customer.id })
  end
end
