class CreatePhotographs < ActiveRecord::Migration[6.0]
  def change
    create_table :photographs do |t|
      t.string     :title,               null: false
      t.date       :date,                null: false
      t.integer    :category_id,         null: false
      t.text       :daybook


      t.timestamps
    end
  end
end
