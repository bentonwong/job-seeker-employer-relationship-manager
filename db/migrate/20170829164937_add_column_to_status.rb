class AddColumnToStatus < ActiveRecord::Migration[5.0]
  def change
    add_column :statuses, :application_id, :integer
  end
end
