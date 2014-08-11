class ReplacePermissionToRole < ActiveRecord::Migration
  def change
    rename_column :employees, :permission_id , :role
    change_column :employees, :role, :string
  end
end
