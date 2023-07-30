class CreatePhotographs < ActiveRecord::Migration[6.0]
  def change
    create_table :photographs do |t|
      t.string     :title,               null: false
      t.string     :info
      t.date       :date,                null: false
      t.timestamps
    end
  end
end
