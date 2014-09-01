class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :text
      t.references :photo, index: true
      t.references :user, index: true
      t.integer :vote_count, default: 0

      t.timestamps
    end
  end
end
