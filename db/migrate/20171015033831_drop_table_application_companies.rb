class DropTableApplicationCompanies < ActiveRecord::Migration[5.0]
  def change
    drop_table :applications_companies
    drop_table :application_companies
  end
end
