class Message < ApplicationRecord
  belongs_to :user
  belongs_to :group
  validates :body, presence: true
  mount_uploader :image, ImageUploader

  def api_json
    {
      name: user.name,
      created_at: created_at,
      body: body,
      image: image.url
    }
  end

end
