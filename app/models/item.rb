class Item < ApplicationRecord
    belongs_to :user
    has_many :messages
    has_many :itempics
    mount_uploader :picture, AvatarUploader
end
