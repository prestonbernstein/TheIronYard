class Location < ActiveRecord::Base
  has_many :user_locations
  has_many :users, through: :user_locations
  has_many :animal_locations
  has_many :animals, through: :animal_locations
  has_many :shelter_locations
  has_many :shelters, through: :shelter_locations

  def full_address
    [address, city, state, zip_code].compact.join(', ')
  end

  geocoded_by :full_address
  after_validation :geocode, if: :address_changed?

end
