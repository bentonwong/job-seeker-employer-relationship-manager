class Company < ApplicationRecord
  has_many :application_company_relationships, class_name: ApplicationCompanyRelationship
  has_many :applications, through: :application_company_relationships

end
