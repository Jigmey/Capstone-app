class HillTop < ActiveRecord::Migration[5.0]
  def change
  	remove_column :activities, :post_id, :integer
  end
end
