class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.references :user, index: true
      t.integer :votable_id, polymorphic: true
      t.string :votable_type
      t.integer :vote_count, default: 0

      t.timestamps
    end
  end
end
