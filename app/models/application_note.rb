class ApplicationNote < ApplicationRecord
  belongs_to :application
  belongs_to :note
end
