class ApplicationCompanyRelationship < ApplicationRecord
  belongs_to :company
  belongs_to :application
  
end
