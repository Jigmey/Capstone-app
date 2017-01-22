class AddImageUrlToGuilds < ActiveRecord::Migration[5.0]
  def change
    add_column :guilds, :image_url, :string
  end
end
