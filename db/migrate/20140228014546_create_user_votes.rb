class CreateUserVotes < ActiveRecord::Migration
  def change
    create_table :user_votes do |t|
      t.integer :link_id
      t.integer :voter_id
      t.string :vote

      t.timestamps
    end
  end
end
