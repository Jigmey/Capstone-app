class TimDoDum < ActiveRecord::Migration[5.0]
  def change
  	add_column :activities, :recordable_id, :integer
  end
end
