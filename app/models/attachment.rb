class Attachment < ApplicationRecord
  has_one :application_attachment
  has_one :application, through: :application_attachment
  mount_uploader :document, DocumentUploader
  
end
