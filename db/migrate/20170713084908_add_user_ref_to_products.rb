class AddUserRefToProducts < ActiveRecord::Migration[5.1]
  def change
    add_reference :products, :user, index: true
    add_foreign_key :products, :users
  end
end
