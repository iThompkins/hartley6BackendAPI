class AddTagsToEvent < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :tags, :string, array: true, default: []
  end
end
