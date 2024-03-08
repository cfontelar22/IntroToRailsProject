class CreateLibraryBranches < ActiveRecord::Migration[7.1]
  def change
    create_table :library_branches do |t|
      t.string :name
      t.string :location

      t.timestamps
    end
  end
end
