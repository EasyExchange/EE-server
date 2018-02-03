class Item < ApplicationRecord
    belongs_to :user
    has_many :messages
    has_many :itempics
<<<<<<< HEAD
    mount_uploader :picture, AvatarUploader
=======
    mount_uploader :picure, AvatarUploader
>>>>>>> 2672eaf58b45f38d4eccadfec639c3baff054ce9
end
