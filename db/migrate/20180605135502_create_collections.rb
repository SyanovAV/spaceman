class CreateCollections < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.references :collection, index: true
      t.string :name
      t.string :description
      t.string :order

      t.timestamps
    end
  end
end
