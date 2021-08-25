class AddPriceToSubscriptions < ActiveRecord::Migration[6.1]
  def change
    add_reference :subscriptions, :price, null: false, foreign_key: true
  end
end
