class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :title
      t.string :url
      t.string :image_uid
      t.string :image_name
      t.references :user, index: true
      t.integer :vote_count, default: 0

      t.timestamps
    end
  end
end
