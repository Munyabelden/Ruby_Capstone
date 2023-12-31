class CreateFoods < ActiveRecord::Migration[7.0]
  def change
    create_table :foods do |t|
      t.string :name
      t.integer :quantity
      t.references :recipes, foreign_key: true

      t.timestamps
    end
  end
end
