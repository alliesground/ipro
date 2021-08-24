class Plan < ApplicationRecord
  has_many :product_plans
  has_many :products, through: :product_plans
end
