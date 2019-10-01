class ChangeActionTagsToDeedTags < ActiveRecord::Migration[5.2]
  def change
    rename_table :action_tags, :deed_tags
  end
end
