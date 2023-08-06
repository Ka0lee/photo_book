class CreatePhotographs < ActiveRecord::Migration[6.0]
  def change
    create_table :photographs do |t|
      t.string     :title,               null: false
      t.string     :info
      t.date       :date,                null: false
      t.references :user,                null: false,foreign_key: true

      t.timestamps
    end
  end
end
