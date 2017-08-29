class Application < ApplicationRecord
  def index
    @applications = Application.all
  end
end
