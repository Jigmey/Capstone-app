class AddIsThisGuildToPosts < ActiveRecord::Migration[5.0]
  def change
    add_column :posts, :is_this_guild, :string
  end
end
