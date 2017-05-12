class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable


has_many :reviews
has_many :spots
  ratyrate_rateable "performance", "original_score", "courtesy", "custome_design"
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

         attr_accessor :raw_address

    geocoded_by :raw_address
    reverse_geocoded_by :latitude, :longitude

    after_validation -> {
      self.address = self.raw_address
      geocode
    }, if: ->(obj){ obj.raw_address.present? and obj.raw_address != obj.address }

    after_validation :reverse_geocode, unless: ->(obj) { obj.raw_address.present? },
                     if: ->(obj){ obj.latitude.present? and obj.latitude_changed? and obj.longitude.present? and obj.longitude_changed? }
end
