class RemoveApplicationIdFromStatus < ActiveRecord::Migration[5.0]
  def change
    remove_column :statuses, :application_id
  end
end
