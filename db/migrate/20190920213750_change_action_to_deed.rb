class ChangeActionToDeed < ActiveRecord::Migration[5.2]
  def change
    rename_table :actions, :deeds
  end
end
