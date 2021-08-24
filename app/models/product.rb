class Product < ApplicationRecord
  has_many :product_plans
  has_many :plans, through: :product_plans
end
