class CreateBooks < ActiveRecord::Migration[7.2]
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.string :description
      t.string :genre
      t.integer :pages
      t.integer :rating
      t.integer :price

      t.timestamps
    end
  end
end
