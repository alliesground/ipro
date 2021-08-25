class CreatePrices < ActiveRecord::Migration[6.1]
  def change
    create_table :prices do |t|
      t.integer :base_price_cents
      t.string :stripe_id
      t.references :product, null: false, foreign_key: true

      t.timestamps
    end
  end
end
