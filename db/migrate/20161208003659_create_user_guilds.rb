class CreateUserGuilds < ActiveRecord::Migration[5.0]
  def change
    create_table :user_guilds do |t|
      t.integer :user_id
      t.integer :guild_id

      t.timestamps
    end
  end
end
