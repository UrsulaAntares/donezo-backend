class CreateDeedShoppings < ActiveRecord::Migration[5.2]
  def change
    create_table :deed_shoppings do |t|

      t.timestamps
    end
  end
end
