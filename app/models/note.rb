class Note < ApplicationRecord
  has_one :application_note
  has_one :application, through: :application_notes
end
