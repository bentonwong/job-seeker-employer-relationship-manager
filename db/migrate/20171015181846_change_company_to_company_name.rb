class ChangeCompanyToCompanyName < ActiveRecord::Migration[5.0]
  def change
    rename_column :applications, :company, :company_name
  end
end
