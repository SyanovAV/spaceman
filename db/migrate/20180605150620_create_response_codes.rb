class CreateResponseCodes < ActiveRecord::Migration[5.1]
  def change
    create_table :response_codes do |t|
      t.integer :code
      t.references :response, index: true

      t.timestamps
    end
  end
end
