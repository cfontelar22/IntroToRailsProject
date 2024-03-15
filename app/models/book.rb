class Book < ApplicationRecord
  belongs_to :library_branch
  has_many :borrowings
  has_many :users, through: :borrowings
  has_many :reviews

  #Validations
  validates :title, presence: true
  validates :author, presence: true

  def self.search(query)
    where('LOWER(title) LIKE LOWER(:query) OR LOWER(author) LIKE LOWER(:query) OR LOWER(genre) LIKE LOWER(:query)', query: "%#{query.downcase}%")
  end
end  

