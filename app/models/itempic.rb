class Itempic < ApplicationRecord
    belongs_to :item
    mount_uploader :picurl, AvatarUploader
end
