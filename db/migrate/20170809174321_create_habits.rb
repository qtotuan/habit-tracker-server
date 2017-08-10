class CreateHabits < ActiveRecord::Migration[5.1]
  def change
    create_table :habits do |t|
      t.string :title
      t.string :description
      t.date :dates_completed, array: true

      t.references :user
      t.references :category

      t.timestamps
    end
  end
end
