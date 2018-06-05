class CreateData < ActiveRecord::Migration[5.1]
  def change
    create_table :data do |t|
      t.string :key
      t.string :value

      t.timestamps
    end
  end
end
