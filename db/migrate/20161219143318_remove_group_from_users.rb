class RemoveGroupFromUsers < ActiveRecord::Migration[5.0]
  def change
    remove_reference :users, :group, foreign_key: true
  end
end
