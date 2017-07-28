class AddNullFalseToPayType < ActiveRecord::Migration[5.1]
  def change
    change_column_null :orders, :pay_type, false
  end
end
