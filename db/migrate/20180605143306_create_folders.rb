class CreateFolders < ActiveRecord::Migration[5.1]
  def change
    create_table :folders do |t|
      t.string :folder_id
      t.string :name
      t.string :description
      t.string :order
      t.references :collection, index: true

      t.timestamps
    end
  end
end
