class AddShoppingIdToDeedShopping < ActiveRecord::Migration[5.2]
  def change
    add_column :deed_shoppings, :shopping_id, :integer
  end
end
