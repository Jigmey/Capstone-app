class AddIsThisProfileToPosts < ActiveRecord::Migration[5.0]
  def change
    add_column :posts, :is_this_profile, :string
  end
end
