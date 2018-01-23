class Item < ApplicationRecord
    belongs_to :user
    has_many :messages
    has_many :itempics
end
