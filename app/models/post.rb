class Post < ApplicationRecord
    validates :title, presence: true,
                      uniqueness: true
                      
    validates :body, presence: true,
                     length: { maximum: 500 }
end
