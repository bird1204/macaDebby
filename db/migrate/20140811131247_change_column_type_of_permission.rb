class ChangeColumnTypeOfPermission < ActiveRecord::Migration
  def change
    rename_column :permissions, :type, :power_type
  end
end
