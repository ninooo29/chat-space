class Group < ApplicationRecord
  has_many :users_groups
  has_many :users, though: :users_groups
  has_many :messages
end
