class AddStuffToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :pic, :string
    add_column :users, :birthdate, :string
  end
end
