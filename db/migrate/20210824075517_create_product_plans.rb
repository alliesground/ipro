class CreateProductPlans < ActiveRecord::Migration[6.1]
  def change
    create_table :product_plans do |t|
      t.references :product, null: false, foreign_key: true
      t.references :plan, null: false, foreign_key: true

      t.timestamps
    end
  end
end
