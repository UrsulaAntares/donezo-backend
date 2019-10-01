class AddEndToDeeds < ActiveRecord::Migration[5.2]
  def change
    add_column :deeds, :end, :date
  end
end
