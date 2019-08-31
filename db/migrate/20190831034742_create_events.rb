class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.text :title
      t.string :host
      t.string :category
      t.string :time
      t.integer :availability
      t.integer :coinVal

      t.timestamps
    end
  end
end
