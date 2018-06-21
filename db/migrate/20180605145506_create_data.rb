class CreateData < ActiveRecord::Migration[5.1]
  def change
    create_table :data do |t|
      t.string :key
      t.string :value
      t.references :request, index: true

      t.timestamps
    end
  end
end
