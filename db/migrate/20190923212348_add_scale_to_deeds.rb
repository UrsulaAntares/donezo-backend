class AddScaleToDeeds < ActiveRecord::Migration[5.2]
  def change
    add_column :deeds, :scale, :string
  end
end
