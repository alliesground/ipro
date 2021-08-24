class CreatePlans < ActiveRecord::Migration[6.1]
  def change
    create_table :plans do |t|
      t.string :name
      t.decimal :base_price, precision: 5, scale: 2

      t.timestamps
    end
  end
end
