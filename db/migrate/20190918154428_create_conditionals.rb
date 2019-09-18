class CreateConditionals < ActiveRecord::Migration[5.2]
  def change
    create_table :conditionals do |t|
      t.string :chore_id
      t.string :gratification_id

      t.timestamps
    end
  end
end
