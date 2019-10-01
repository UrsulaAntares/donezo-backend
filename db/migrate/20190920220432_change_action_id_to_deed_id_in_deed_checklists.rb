class ChangeActionIdToDeedIdInDeedChecklists < ActiveRecord::Migration[5.2]
  def change
    rename_column :deed_checklists, :action_id, :deed_id
  end
end
