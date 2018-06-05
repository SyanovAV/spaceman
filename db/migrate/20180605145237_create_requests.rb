class CreateRequests < ActiveRecord::Migration[5.1]
  def change
    create_table :requests do |t|
      t.string :request_id
      t.string :raw_headers
      t.string :description
      t.string :method
      t.string :url
      t.references :data, index: true
      t.string :data_mode
      t.string :tests
      t.string :name
      t.string :raw_mode_data
      t.references :responce, index: true
      t.string :path_variables

      t.timestamps
    end
  end
end
