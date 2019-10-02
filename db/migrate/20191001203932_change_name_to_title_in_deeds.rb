class ChangeNameToTitleInDeeds < ActiveRecord::Migration[5.2]
  def change
    rename_column :deeds, :name, :title
  end
end
