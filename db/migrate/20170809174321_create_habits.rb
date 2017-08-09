class CreateHabits < ActiveRecord::Migration[5.1]
  def change
    create_table :habits do |t|
      t.string :title
      t.string :description

      t.references :user
      t.references :category

      t.timestamps
    end
  end
end
