class ApplicationsController < ApplicationController

  def index
    @applications = Application.all
    @status = Status.all
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
    @status = Status.find_by(id: @application.status_id)
  end

  def edit
    @application = Application.find_by(id: params[:id])
  end

  def update
    @application = Application.find_by(id: params[:id])
    if @application.update(application_params)
      redirect_to @application
    else
      redirect_to edit_application_path(@application)
    end
  end

  def destroy
    @application = Application.find_by(id: params[:id])
    @application.destroy
    redirect_to applications_path
  end

  private

    def application_params
      params.require(:application).permit(:company, :position, :description, :location, :posting_url, :document, :notes, :status_id, notes_attributes: [:date, :content], attachments_attributes: [:name, :document])
    end

    def google_map(center)
      "https://maps.googleapis.com/maps/api/staticmap?center=#{center}&size=300x300&zoom=17"
    end

end
