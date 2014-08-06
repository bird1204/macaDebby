class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string :name
      t.string :mobile
      t.text :address
      t.integer :permission_id
      t.boolean :enabled
      t.timestamps
    end
  end
end
