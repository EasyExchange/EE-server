class User < ApplicationRecord
    has_many :items
    has_many :send_messages, class_name:"Message",foreign_key:"sender_id"
    has_many :receive_messages, class_name:"Message",foreign_key:"receiver_id"
    validates :name, presence: true, uniqueness: true
end
