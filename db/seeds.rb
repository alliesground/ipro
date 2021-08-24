# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

ActiveRecord::Base.transaction do
  basic_plan = Plan.find_or_create_by!(name: 'basic') do |plan|
    plan.base_price = 10
  end

  pro_plan = Plan.find_or_create_by!(name: 'pro') do |plan|
    plan.base_price = 20
  end

  enterprise_plan = Plan.find_or_create_by!(name: 'enterprise') do |plan|
    plan.base_price = 30
  end

  
  # create product_a and associate it with plans
  #
  product_a = Product.find_or_create_by!(name: 'product-A')

  ProductPlan.where(product_id: product_a.id, plan_id: basic_plan.id)
    .first_or_create! do |pp|
    pp.plan_id = basic_plan.id
  end

  ProductPlan.where(product_id: product_a.id, plan_id: pro_plan.id)
    .first_or_create! do |pp|
    pp.plan_id = pro_plan.id
  end

  ProductPlan.where(product_id: product_a.id, plan_id: enterprise_plan.id)
    .first_or_create! do |pp|
    pp.plan_id = enterprise_plan.id
  end

  # create product_b and associate it with plans
  #
  product_b = Product.find_or_create_by!(name: 'product-B')

  ProductPlan.where(product_id: product_b.id, plan_id: basic_plan.id)
    .first_or_create! do |pp|
    pp.plan_id = basic_plan.id
  end

  ProductPlan.where(product_id: product_b.id, plan_id: pro_plan.id)
    .first_or_create! do |pp|
    pp.plan_id = pro_plan.id
  end

  ProductPlan.where(product_id: product_b.id, plan_id: enterprise_plan.id)
    .first_or_create! do |pp|
    pp.plan_id = enterprise_plan.id
  end
end
