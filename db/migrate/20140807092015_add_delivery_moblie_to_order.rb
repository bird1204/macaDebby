class AddDeliveryMoblieToOrder < ActiveRecord::Migration
  def change
    add_column :orders , :delivery_mobile , :string
  end
end
