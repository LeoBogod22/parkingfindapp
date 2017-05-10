class Addtospots < ActiveRecord::Migration[5.0]
  def change

    add_column :spots, :status, :string

  end
end
