class CreateActionChecklists < ActiveRecord::Migration[5.2]
  def change
    create_table :action_checklists do |t|
      t.references :action
      t.references :checklist

      t.timestamps
    end
  end
end
