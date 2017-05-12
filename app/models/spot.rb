class Spot < ApplicationRecord




ratyrate_rateable 'visual_effects', 'original_score', 'director', 'custome_design'

ratyrate_rater
  geocoded_by :address
validates_presence_of :title
validates_presence_of :address


belongs_to :user
has_many :reviews
  after_validation :geocode
end
