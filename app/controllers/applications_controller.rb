class ApplicationsController < ApplicationController

  def index
    @applications = Application.all
  end

  def new
    @application = Application.new
  end

  def create
    @application = Application.new(application_params)
    if @application.save
      redirect_to @application
    else
      render :new
    end
  end

  def show
    @application = Application.find_by(id: params[:id])
  end

  private

    def application_params
      params.require(:application).permit(:company, :position, :description, :notes)
    end

end
