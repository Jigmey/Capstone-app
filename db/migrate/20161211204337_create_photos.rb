class CreatePhotos < ActiveRecord::Migration[5.0]
  def change
    create_table :photos do |t|
      t.string :src
      t.string :link
      t.string :caption

      t.timestamps
    end
  end
end
