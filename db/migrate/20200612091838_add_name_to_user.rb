class AddNameToUser < ActiveRecord::Migration[6.0]
  #Rails automatically knew u don wannn create a table since ulianza na kuandika add
  def change
    add_column :users, :name, :string 
  end
end
