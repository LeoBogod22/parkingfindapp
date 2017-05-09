class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

         reverse_geocoded_by :latitude, :longitude,
           :address => :location
         after_validation :reverse_geocode

end
