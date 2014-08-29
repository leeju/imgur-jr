class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :value
      t.references :user, index: true
      t.integer :votable_id, polymorphic: true
      t.string :votable_type

      t.timestamps
    end
  end
end
