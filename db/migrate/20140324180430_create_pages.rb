class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.references :story, index: true
      t.text :text
      t.string :title
      t.integer :position
      t.integer :posx
      t.integer :posy
      t.integer :posz
      t.integer :readed, :default => 0
      t.boolean :ending, :default => false

      t.timestamps
    end
    add_index :pages, :position
  end
end
