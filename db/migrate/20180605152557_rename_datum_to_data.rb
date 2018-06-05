class RenameDatumToData < ActiveRecord::Migration[5.1]
  def change
    rename_table :data, :data
  end
end
