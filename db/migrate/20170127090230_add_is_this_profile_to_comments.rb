class AddIsThisProfileToComments < ActiveRecord::Migration[5.0]
  def change
    add_column :comments, :is_this_profile, :string
  end
end
