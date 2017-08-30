class DocumentsController < ApplicationController
  def index
    @documents = Document.all
    @document = Document.new
  end

  def create
    @document = Document.new(document_params)

    if @document.save
      render json: { message: "success", fileID: @document.id }, :status => 200
    else
      render json: { error: @document.errors.full_message.join(', ')}, :status => 400
    end
  end

  def destroy
  end

  private

  def document_params
    params.require(:document).permit(:document_name)
  end

end
