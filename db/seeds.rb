# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

unless Product.exists?
  ActiveRecord::Base.transaction do
    product_a = Product.create!(name: 'product-A')

    product_a.prices.create!([
      { base_price_cents: 1000 },
      { base_price_cents: 2000 }
    ])
  end
end


