class CreateUsersGroups < ActiveRecord::Migration[5.0]
  def change
    create_table :users_groups do |t|
      t.references :user
      t.references :group
      t.timestamps
    end
  end
end
