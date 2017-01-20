class RemoveProfileIdFromPosts < ActiveRecord::Migration[5.0]
  def change
    remove_column :posts, :profile_id, :integer
  end
end
