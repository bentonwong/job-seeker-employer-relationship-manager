class EmailsController < ApplicationController
  def index
    @emails = Email.all
  end

  def show
    @email = Email.find_by(id: params[:id])
  end

  def edit
    @email = Email.find_by(id: params[:id])
  end

  def update
    @email = Email.find_by(id: params[:id])
    if @email.update(email_params)
      redirect_to @email
    else
      redirect_to edit_application_path(@email)
    end
  end

  private

    def email_params
      params.require(:email).permit(:application_id)
    end

end
