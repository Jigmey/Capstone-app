class AddGuildIdToPosts < ActiveRecord::Migration[5.0]
  def change
    add_column :posts, :guild_id, :integer
  end
end
