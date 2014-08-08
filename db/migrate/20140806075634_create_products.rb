class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.string :intro
      t.text :desc
      t.integer :price
      t.integer :discount
      t.boolean :is_top
      t.boolean :enabled
      t.timestamps
    end
  end
end
