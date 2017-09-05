class CreateEmails < ActiveRecord::Migration[5.0]
  def change
    create_table :emails do |t|
      t.string :subject
      t.text :body
      t.string :to
      t.string :from
      t.date :date

      t.timestamps
    end
  end
end
