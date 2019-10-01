class AddTimeToDeeds < ActiveRecord::Migration[5.2]
  def change
    add_column :deeds, :duetime, :time
  end
end
