class AddFieldsToApplications < ActiveRecord::Migration[5.0]
  def change
    add_column :applications, :posting_url, :string
  end
end
