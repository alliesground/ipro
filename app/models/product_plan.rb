class ProductPlan < ApplicationRecord
  belongs_to :product
  belongs_to :plan
end
