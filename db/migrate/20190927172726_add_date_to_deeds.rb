class AddDateToDeeds < ActiveRecord::Migration[5.2]
  def change
    add_column :deeds, :duedate, :date 
  end
end
