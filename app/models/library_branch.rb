class LibraryBranch < ApplicationRecord
    has_many :books

    #Validations
    validates :name, presence: true, uniqueness: true
    validates :location, presence: true
  end
  