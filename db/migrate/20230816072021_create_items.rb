class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.references :genre_id, null: false, foreign_key: true
      t.string :name, null: false
      t.text :detail, null: false
      t.integer :price, null: false
      t.boolean :is_active, default: true, null: false

      t.timestamps
    end
  end
end
