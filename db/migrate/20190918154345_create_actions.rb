class CreateActions < ActiveRecord::Migration[5.2]
  def change
    create_table :actions do |t|
      t.string :name
      t.integer :duration
      t.string :description
      t.datetime :due
      t.integer :importance
      t.integer :desirability
      t.string :supplies

      t.timestamps
    end
  end
end
