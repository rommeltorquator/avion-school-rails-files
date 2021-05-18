class Post < ApplicationRecord
    validates :title, presence: true,
                      uniqueness: true
                      
    validates :body, presence: true,
                     length: { minimum: 15 }

    # for grouping the posts
    def day
        self.created_at.strftime("%B %e, %Y")
    end
end
