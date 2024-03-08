class Weather < ApplicationRecord
    
    #Validations
    validates :location, presence: true
    validates :temperature, presence: true
    validates :humidity, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 100 }
    validates :wind_speed, numericality: true
  end