class DropCompanyIdFromApplications < ActiveRecord::Migration[5.0]
  def change
    remove_column :applications, :company_id
  end
end
