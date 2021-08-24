class User < ApplicationRecord
  before_create :generate_token

  private

  def generate_token
    loop do
      self.token = SecureRandom.hex
      break unless self.class.exists?(token: token)
    end
  end
end
