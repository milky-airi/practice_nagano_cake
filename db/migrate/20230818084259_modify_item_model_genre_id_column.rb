class ModifyItemModelGenreIdColumn < ActiveRecord::Migration[6.1]
  def change
    remove_column :items, :genre_id_id, :integer, null: false
    add_column :items, :genre_id, :integer, null: false
  end
end
