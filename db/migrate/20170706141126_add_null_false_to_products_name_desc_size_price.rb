class AddNullFalseToProductsNameDescSizePrice < ActiveRecord::Migration[5.1]
  def change
    change_column_null :products, :name, false
    change_column_null :products, :desc, false
    change_column_null :products, :size, false
    change_column_null :products, :price, false
  end
end
