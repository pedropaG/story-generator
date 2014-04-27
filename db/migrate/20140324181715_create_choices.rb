class CreateChoices < ActiveRecord::Migration
  def change
    create_table :choices do |t|
      t.integer :page_init, :null => false
      t.integer :page_fin, :null => false
      t.string :text, :null => false
      #t.image :image
      t.integer :picked, :default => 0

      t.timestamps
    end
    add_index :choices, :page_fin
    add_index :choices, :page_init
  end
end
