class CreateLikes < ActiveRecord::Migration[6.0]
  def change
    create_table :likes do |t|
      t.boolean :like
      t.integer :user_id
      t.integer :recipe_id
      t.timestamps

    end
  end
end
