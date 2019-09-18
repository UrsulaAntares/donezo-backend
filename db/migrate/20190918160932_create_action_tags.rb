class CreateActionTags < ActiveRecord::Migration[5.2]
  def change
    create_table :action_tags do |t|
      t.references :action, foreign_key: true
      t.references :tag, foreign_key: true

      t.timestamps
    end
  end
end
