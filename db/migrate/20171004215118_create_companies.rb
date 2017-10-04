class CreateCompanies < ActiveRecord::Migration[5.0]
  def change
    create_table :companies do |t|
      t.string :name
      t.string :industry
      t.text :website
      t.decimal :overall_rating
      t.string :square_logo
      t.string :ceo_name

      t.timestamps
    end
  end
end
