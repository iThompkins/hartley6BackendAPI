class AddEventIdToGroups < ActiveRecord::Migration[5.2]
  def change
    add_column :groups, :event_id, :integer
  end
end
