class CreateSpots < ActiveRecord::Migration[5.0]
  def change
    create_table :spots do |t|
      t.string :title
      t.float   :longitude
      t.string  :address
      t.string  :zipcode
      t.string  :city
      t.float   :latitude

      t.timestamps
    end
  end
end
