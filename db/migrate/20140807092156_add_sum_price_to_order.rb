class AddSumPriceToOrder < ActiveRecord::Migration
  def change
    add_column :orders , :sum_price , :integer
  end
end
