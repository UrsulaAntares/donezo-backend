class ChangeActionIdToDeedIdInDeedTags < ActiveRecord::Migration[5.2]
  def change
    rename_column :deed_tags, :action_id, :deed_id
  end
end
