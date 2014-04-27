class CreateStories < ActiveRecord::Migration
  def change
    create_table :stories do |t|
      t.string :title, :null => false
      t.references :user, :null => false
      t.integer :status, :default => 0, :null => false
      t.integer :readed, :default => 0, :null => false
      t.float :score

      t.timestamps
    end
    add_index :stories, :title, :unique => true
    add_index :stories, :user_id
  end
end
