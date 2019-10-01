class ChangeActionCheclistToDeedChecklist < ActiveRecord::Migration[5.2]
  def change
    rename_table :action_checklists, :deed_checklists
  end
end
