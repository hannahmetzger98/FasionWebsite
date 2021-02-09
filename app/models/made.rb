class Made < ApplicationRecord
    belongs_to :user
    validates  :content, length:  {maximum: 100}, presence:   true
    has_one_attached :image
end
