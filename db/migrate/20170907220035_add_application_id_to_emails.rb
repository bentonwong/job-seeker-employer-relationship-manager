class AddApplicationIdToEmails < ActiveRecord::Migration[5.0]
  def change
    add_column :emails, :application_id, :integer
  end
end
