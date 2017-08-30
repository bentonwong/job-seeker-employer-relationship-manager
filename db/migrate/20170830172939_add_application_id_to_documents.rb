class AddApplicationIdToDocuments < ActiveRecord::Migration[5.0]
  def change
    add_column :documents, :document_id, :integer
  end
end
