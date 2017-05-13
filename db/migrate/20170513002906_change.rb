class Change < ActiveRecord::Migration[5.0]
  def change

      add_column :spots, :phonenumber, :string
  end
end
