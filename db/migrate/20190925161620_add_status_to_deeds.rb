class AddStatusToDeeds < ActiveRecord::Migration[5.2]
  def change
    add_column :deeds, :status, :string
  end
end
