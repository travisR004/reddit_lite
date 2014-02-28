class CreateLinkSubs < ActiveRecord::Migration
  def change
    create_table :link_subs do |t|
      t.integer :sub_id
      t.integer :link_id
    end
    remove_column :links, :sub_id
  end
end
