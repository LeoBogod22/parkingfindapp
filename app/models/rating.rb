class Rating < ApplicationRecord
  belongs_to :rateable, polymorphic: true
belongs_to :user
validates_presence_of :rate_value

end
