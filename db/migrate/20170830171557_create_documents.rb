class CreateDocuments < ActiveRecord::Migration[5.0]
  def change
    create_table :documents do |t|
      t.attachment :document_name

      t.timestamps
    end
  end
end
