class DropTableUserGroups < ActiveRecord::Migration[5.0]
  def change
    drop_table :user_groups
  end
end
