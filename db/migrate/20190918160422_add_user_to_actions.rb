class AddUserToActions < ActiveRecord::Migration[5.2]
  def change
    add_column :actions, :user_id, :integer
  end
end
