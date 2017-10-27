# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
statuses = ["Propsecting", "Applied", "Interviewing", "Offer", "Hired", "No offer", "Pass", "Archieve"]
statuses.each do |status|
  Status.create(name: status)
end

companies = ["Uber", "Apple", "Salesforce", "Google", "LinkedIn", "Amazon", "Airbnb", "Facebook", "Ebay", "Twitter"]
companies.each do |company|
  Application.create(position: Faker::Job.title, company_name: company, description: "", location: "", posting_url: Faker::Internet.url)
end
