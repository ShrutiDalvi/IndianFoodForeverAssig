class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.references :category
      t.string :name
      t.string :ingredients
      t.string :description

      t.timestamps
    end
  end
end