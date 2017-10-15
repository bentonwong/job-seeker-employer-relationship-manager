class CreateApplicationCompanies < ActiveRecord::Migration[5.0]
  def change
    create_table :application_companies do |t|

      t.timestamps
    end
  end
end
