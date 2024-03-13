class Book < ApplicationRecord
  belongs_to :library_branch
  has_many :borrowings
  has_many :users, through: :borrowings
  has_many :reviews


  #Validations
  validates :title, presence: true
  validates :author, presence: true
  
end
