class Addrating < ActiveRecord::Migration[5.0]
  def change

    add_column :users, :rating, :string

  end
end
