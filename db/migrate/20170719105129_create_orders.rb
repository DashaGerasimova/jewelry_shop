class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.string :name
      t.string :phone_number
      t.string :email
      t.text :address
      t.integer :pay_type

      t.timestamps
    end
  end
end
