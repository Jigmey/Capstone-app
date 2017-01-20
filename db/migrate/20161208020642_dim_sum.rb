class DimSum < ActiveRecord::Migration[5.0]
  def change
  	add_column :activities, :recordable_type, :string
  end
end
