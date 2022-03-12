class Blog < ApplicationRecord
 belongs_to :user
 validates :content, presence: true, unless: :image?
 mount_uploader :image, ImageUploader
 has_many :loves, dependent: :destroy
 has_many :users, through: :loves

end
