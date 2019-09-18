class AddEnvironmentToActions < ActiveRecord::Migration[5.2]
  def change
    add_column :actions, :environment_id, :integer
  end
end
