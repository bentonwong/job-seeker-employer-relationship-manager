class Application < ApplicationRecord
  belongs_to :status
  has_many :application_notes
  has_many :notes, through: :application_notes
  mount_uploader :document, DocumentUploader

  def notes_attributes=(notes_attributes)
    notes_attributes.values.each {|note_attributes| self.notes.build(note_attributes) if note_attributes.present? && note_attributes[:content].present?}
  end
end
