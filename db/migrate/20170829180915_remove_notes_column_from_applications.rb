class RemoveNotesColumnFromApplications < ActiveRecord::Migration[5.0]
  def change
    remove_column :applications, :notes
  end
end
