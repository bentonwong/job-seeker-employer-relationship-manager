class ApplicationsController < ApplicationController

  def index
    if params["status"].present? && params["status"]["id"].present?
      @id = params["status"]["id"]
      @applications = Application.where(status_id: @id)
    else
      @applications = Application.all
    end
    @statuses = Status.all
  end

  def new
    @application = Application.new
  end

  def create
    @application = Application.new(application_params)
    if @application.save
      redirect_to :controller => 'companies', :action => 'glassdoor_search', :params => {:query => @application.company_name, :application_id => @application.id}
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
      params.require(:application).permit(:company_name, :position, :description, :location, :posting_url, :document, :notes, :status_id, notes_attributes: [:date, :content], attachments_attributes: [:name, :document])
    end

end
