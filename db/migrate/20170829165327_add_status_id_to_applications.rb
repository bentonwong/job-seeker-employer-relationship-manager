class AddStatusIdToApplications < ActiveRecord::Migration[5.0]
  def change
    add_column :applications, :status_id, :integer
  end
end
