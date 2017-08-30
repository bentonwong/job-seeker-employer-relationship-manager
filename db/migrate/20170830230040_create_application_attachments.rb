class CreateApplicationAttachments < ActiveRecord::Migration[5.0]
  def change
    create_table :application_attachments do |t|
      t.integer :application_id
      t.integer :attachment_id

      t.timestamps
    end
  end
end
