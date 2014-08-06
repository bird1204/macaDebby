class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :product_id
      t.integer :customer_id
      t.integer :quantity
      t.integer :status
      t.text :delivery_name
      t.text :delivery_address
      t.integer :delivery_method
      t.integer :payment
      t.boolean :enabled
      t.timestamps
    end
  end
end
