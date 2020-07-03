class CreateRecipes < ActiveRecord::Migration[6.0]
  def change
    create_table :recipes do |t|
      # nashuku error apa
      t.string :name , :summary , :description
      t.timestamps
    end
  end
end
