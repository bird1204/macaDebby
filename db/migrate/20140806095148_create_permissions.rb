class CreatePermissions < ActiveRecord::Migration
  def change
    create_table :permissions do |t|
      t.string :type
      t.integer :power
      
      t.timestamps
    end
  end
end
