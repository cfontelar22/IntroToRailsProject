class Book < ApplicationRecord
  belongs_to :library_branch
  has_many :borrowings
  has_many :users, through: :borrowings

  #Validations
  validates :title, presence: true
  validates :author, presence: true
  
end
