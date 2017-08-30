class AddDocumentToApplications < ActiveRecord::Migration[5.0]
  def change
    add_column :applications, :document, :string
  end
end
