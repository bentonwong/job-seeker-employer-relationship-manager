class CompaniesController < ApplicationController

  def search
  end

  def glassdoor_search
    ip, user_agent = request.remote_ip, request.env['HTTP_USER_AGENT']
    Company.search(params, ip, user_agent)
    @application = Application.find_by(id: params[:application_id])
    redirect_to @application
  end

end
