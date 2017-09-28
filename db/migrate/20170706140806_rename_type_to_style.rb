class RenameTypeToStyle < ActiveRecord::Migration[5.1]
  def change
    rename_column :products, :jewel_type, :style
  end
end
