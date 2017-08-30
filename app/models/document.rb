class Document < ApplicationRecord
  has_attached_file :document_name, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/documents/:style/missing.png"
  validates_attachment_content_type :document_name, :content_type => /\Adocument\/.*\Z/
end
