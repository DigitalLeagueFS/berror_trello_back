class CreateCards < ActiveRecord::Migration[6.0]
  def change
    create_table :cards do |t|
      t.string :name
      t.text :description
      t.string :background_color
      t.datetime :due
      t.references :column, null: false, foreign_key: true
      #t.references :user, null: true, foreign_key: true

      t.timestamps
    end
  end
end
