class CreateApplications < ActiveRecord::Migration[5.0]
  def change
    create_table :applications do |t|
      t.string :position
      t.string :company
      t.text :description
      t.string :location
      t.string :status
      t.text :notes

      t.timestamps
    end
  end
end
