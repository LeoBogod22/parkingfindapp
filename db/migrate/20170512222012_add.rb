class Add < ActiveRecord::Migration[5.0]
  def change

    add_column :spots, :user_id, :integer

  end
end
