class AddPackToDeeds < ActiveRecord::Migration[5.2]
  def change
    add_column :deeds, :pack, :string
  end
end
