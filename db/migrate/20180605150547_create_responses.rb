class CreateResponses < ActiveRecord::Migration[5.1]
  def change
    create_table :responses do |t|
      t.string :responce_id
      t.string :name
      t.string :status
      t.string :value
      t.string :text
      t.references :request, index: true

      t.timestamps
    end
  end
end
