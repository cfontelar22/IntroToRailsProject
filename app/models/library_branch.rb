class LibraryBranch < ApplicationRecord
  has_many :books

  # Assuming 'location' holds the address for geocoding
  geocoded_by :location
  # Ensure that geocode is called only if location is present and has changed
  after_validation :geocode, if: ->(obj){ obj.location.present? && obj.location_changed? }

  # Validations
  validates :name, presence: true, uniqueness: true
  validates :location, presence: true
end
