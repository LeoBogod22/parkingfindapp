class Numbertospots < ActiveRecord::Migration[5.0]
  def change
    add_column :spots, :number, :integer
  end
end
