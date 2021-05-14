class Post < ApplicationRecord
    validates :title, presence: true,
                      uniqueness: true
                      
    validates :body, presence: true,
                     length: { maximum: 500 }

    validate :title_length_must_be_more_than_5
    validate :title_must_start_with_r

    def title_length_must_be_more_than_5
        if title.length < 6
            errors.add(:title, "can't be less than 5")
        end
    end

    def title_must_start_with_r
        if title[0] != 'R'
            errors.add("The first letter must be letter R")
        end
    end
end
