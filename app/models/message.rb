class Message < ApplicationRecord
    belongs_to :sender, class_name: "User"
    belongs_to :receiver, class_name: "User"
    belongs_to :item
    
    def as_json(options = {})
      if options
        super
      else
        super.merge(
          :item => self.item,
          :sender => self.sender
        )
      end
    end
end
