class Application < ApplicationRecord
  belongs_to :status
  has_many :application_notes
  has_many :notes, through: :application_notes
  has_many :application_attachments
  has_many :attachments, through: :application_attachments
  mount_uploader :document, DocumentUploader


  def notes_attributes=(notes_attributes)
    notes_attributes.values.each {|note_attributes| self.notes.build(note_attributes) if note_attributes.present? && note_attributes[:content].present?}
  end

  def attachments_attributes=(attachments_attributes)
    attachments_attributes.values.each {|attachment_attributes| self.attachments.build(attachment_attributes) if attachment_attributes.present? && attachment_attributes[:document].present?}
  end

end
