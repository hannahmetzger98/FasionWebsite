class Message < ApplicationRecord
    belongs_to   :user  
    has_one_attached    :image  
    validates  :content, length:  {maximum: 100}, presence:   true
    validates  :image,  content_type:  {in: %w[image/jpeg image/gif image/png], 
  			            message:  "The file must be a valid image format!"},
		                size:  {less_than: 5.megabytes, 
                        message: "file should be less than 5MB!"}

end
