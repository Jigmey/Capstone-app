class AddIsThisGuildToComments < ActiveRecord::Migration[5.0]
  def change
    add_column :comments, :is_this_guild, :string
  end
end
