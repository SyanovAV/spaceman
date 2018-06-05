class CreateCollections < ActiveRecord::Migration[5.1]
  def change
    create_table :collections do |t|
      t.string :name
      t.string :description
      t.references :requests, index: true
      t.references :folder, index: true
      t.string :order

      t.timestamps
    end
  end
end
