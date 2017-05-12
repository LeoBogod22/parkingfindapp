class Addimbdb < ActiveRecord::Migration[5.0]
  def change

        add_column :spots, :imdb_id, :string
  end
end
