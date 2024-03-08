class CreateBooks < ActiveRecord::Migration[7.1]
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.string :genre
      t.integer :publication_year
      t.references :library_branch, null: false, foreign_key: true

      t.timestamps
    end
  end
end
