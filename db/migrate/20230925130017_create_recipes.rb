class CreateRecipes < ActiveRecord::Migration[7.0]
  def change
    create_table :recipes do |t|
      t.string :title
      t.text :description
      t.string :photo
      t.boolean :public, default: false
      t.string :cooking_time
      t.references :user, foreign_key: true
      
      t.timestamps
    end
  end
end
