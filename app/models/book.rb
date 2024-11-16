class Book < ApplicationRecord
    # Add validation
    validates :title, presence: true
    validates :author, presence: true
    validates :description, presence: true
    validates :genre, presence: true
    validates :pages, presence: true, numericality: { only_integer: true, greater_than: 0 }
    validates :rating, presence: true, numericality: { only_integer: true, greater_than: 0, less_than_or_equal_to: 5 }
    validates :pages, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
