class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.string :title, null: false
      t.string :url, null: false
      t.string :description
      t.integer :submitter_id, null: false
      t.integer :sub_id, null: false

      t.timestamps
    end
  end
end
