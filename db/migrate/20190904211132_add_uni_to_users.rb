class AddUniToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :uni, :string
  end
end
