class AddDoneTimeToDeeds < ActiveRecord::Migration[5.2]
  def change
    add_column :deeds, :donetime, :time
  end
end
