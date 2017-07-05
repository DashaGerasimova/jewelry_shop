class CreateJewels < ActiveRecord::Migration[5.1]
  def change
    create_table :jewels do |t|
      t.string :name
      t.text :desc
      t.string :jewel_type
      t.integer :size
      t.string :image
      t.decimal :price

      t.timestamps
    end
  end
end
