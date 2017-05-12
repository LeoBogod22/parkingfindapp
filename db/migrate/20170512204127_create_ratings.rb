class CreateRatings < ActiveRecord::Migration[5.0]
  def change
    create_table :ratings do |t|
      t.integer		:rate_value
      t.integer   :rateable_id
      t.integer   :rateable_type
    t.integer		:user_id
    t.timestamps
    end
  end
end
