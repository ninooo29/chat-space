class RemoveUserFromGroups < ActiveRecord::Migration[5.0]
  def change
    remove_reference :groups, :user
  end
end
