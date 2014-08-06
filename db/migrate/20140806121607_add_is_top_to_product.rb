class AddIsTopToProduct < ActiveRecord::Migration
  def change
    add_column :products , :is_top , :boolean
  end
end
