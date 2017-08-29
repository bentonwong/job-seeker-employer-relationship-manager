class Application < ApplicationRecord
  def index
    @applications = Application.all
  end

  def new
    @application = Application.new
  end
  
  def show
    @application = Application.find_by(id: params[:id])
  end
end
