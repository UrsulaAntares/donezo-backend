class AddDeedIdToDeedShopping < ActiveRecord::Migration[5.2]
  def change
    add_column :deed_shoppings, :deed_id, :integer
  end
end
