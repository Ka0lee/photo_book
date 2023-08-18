class Photographs < ActiveRecord::Migration[6.0]
  def change
    t.string     :title,               null: false
    t.date       :date,                null: false
    t.integer    :category_id,         null: false
    t.text       :daybook
    t.references :user,                null: false,foreign_key: true

  end
end
