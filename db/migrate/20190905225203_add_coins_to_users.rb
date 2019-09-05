class AddCoinsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :coins, :integer, default: 100
  end
end
