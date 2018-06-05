class CreateHeaders < ActiveRecord::Migration[5.1]
  def change
    create_table :headers do |t|
      t.string :name
      t.string :key
      t.string :value
      t.string :description

      t.timestamps
    end
  end
end
