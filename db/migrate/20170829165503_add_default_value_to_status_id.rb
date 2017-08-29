class AddDefaultValueToStatusId < ActiveRecord::Migration[5.0]
  def change
    change_column :applications, :status_id, :integer, default: 1
  end
end
