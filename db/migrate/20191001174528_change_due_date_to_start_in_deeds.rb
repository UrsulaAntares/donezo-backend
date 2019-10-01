class ChangeDueDateToStartInDeeds < ActiveRecord::Migration[5.2]
  def change
    rename_column :deeds, :duedate, :start
  end
end
