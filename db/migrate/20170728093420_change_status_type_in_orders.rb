class ChangeStatusTypeInOrders < ActiveRecord::Migration[5.1]
  def change
    change_column :orders, :status, :string
  end
end
