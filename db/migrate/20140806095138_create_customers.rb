class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.integer :permission_id
      t.string :name
      t.string :mobile
      t.text :address
      t.boolean :is_member
      t.timestamps
    end
  end
end
