class AddDoneDateToDeeds < ActiveRecord::Migration[5.2]
  def change
    add_column :deeds, :donedate, :date
  end
end
