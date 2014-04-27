class CreatePlots < ActiveRecord::Migration
  def change
    create_table :plots do |t|
      t.string :name
      t.string :color
      t.references :story
      t.references :page

      t.timestamps
    end
  end
end
