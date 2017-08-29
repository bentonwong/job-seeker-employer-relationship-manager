class DeleteStatusFromApplications < ActiveRecord::Migration[5.0]
  def change
    remove_column :applications, :status
    remove_column :applications, :status_id
  end
end
