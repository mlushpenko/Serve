class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title
      t.string :category
      t.string :author
      t.text :description
      
      t.references :category
      t.timestamps
    end
    add_index :books, :category_id
  end
end
