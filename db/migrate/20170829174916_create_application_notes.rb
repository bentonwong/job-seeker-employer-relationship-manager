class CreateApplicationNotes < ActiveRecord::Migration[5.0]
  def change
    create_table :application_notes do |t|
      t.integer :application_id
      t.integer :note_id

      t.timestamps
    end
  end
end
