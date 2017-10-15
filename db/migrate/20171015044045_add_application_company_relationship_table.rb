class AddApplicationCompanyRelationshipTable < ActiveRecord::Migration[5.0]
  def change
    create_table :application_company_relationships, :id => false do |t|
      t.integer :application_id
      t.integer :company_id
    end
  end
end
