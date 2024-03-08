class User < ApplicationRecord
    has_many :borrowings
    has_many :books, through: :borrowings

    #Validations
    validates :name, presence: true
    validates :email, presence: true, uniqueness: { case_sensitive: false }
end
