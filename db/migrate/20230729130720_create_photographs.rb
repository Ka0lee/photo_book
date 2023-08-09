class CreatePhotographs < ActiveRecord::Migration[6.0]
  def change
    create_table :photographs do |t|
      t.string     :title,               null: false
      t.string     :diary
      t.date       :date,                null: false
      t.integer    :category_id,         null: false
      t.references :user,                null: false,foreign_key: true

      t.timestamps
    end
  end
end
