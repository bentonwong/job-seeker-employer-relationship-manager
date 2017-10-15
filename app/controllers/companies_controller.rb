require 'pry'

class CompaniesController < ApplicationController

  def search
  end

  def glassdoor_search
    begin
      @resp = Faraday.get "http://api.glassdoor.com/api/api.htm?" do |req|
        req.params['v'] = 1
        req.params['format'] = "json"
        req.params['t.p'] = ENV["GLASSDOOR_PARTNER_ID"]
        req.params['t.k'] = ENV["GLASSDOOR_KEY"]
        req.params['userip'] = request.remote_ip
        req.params['useragent'] = request.env['HTTP_USER_AGENT']
        req.params['q'] = params[:query]
        req.params['action'] = "employers"
      end

      if @resp.success?
        body = JSON.parse(@resp.body)
        companies = body["response"]["employers"]
        @exact_match = companies.select {|company| company["exactMatch"] == true}.first
        new_company = Company.find_or_create_by(name: @exact_match["name"]) do |company|
           company.industry = @exact_match["industry"]
           company.website = @exact_match["website"]
           company.overall_rating = @exact_match["overallRating"]
           company.square_logo = @exact_match["squareLogo"]
           company.ceo_name = @exact_match["ceo"]["name"]
        end
        redirect_to applications_path(params[:application_id])
      else
        @error = body["meta"["errorDetail"]]
      end
      rescue Faraday::TimeoutError
        @error = "There was a timeout. Please try again."
      end

    end

end
