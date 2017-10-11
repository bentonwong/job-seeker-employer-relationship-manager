class CompaniesController < ApplicationController

  def search
  end

  def glassdoor_search
    raise params[:application_id].inspect
    begin
      @resp = Faraday.get "http://api.glassdoor.com/api/api.htm?" do |req|
        req.params['v'] = 1
        req.params['format'] = "json"
        req.params['t.p'] = ENV["GLASSDOOR_PARTNER_ID"]
        req.params['t.k'] = ENV["GLASSDOOR_KEY"]
        req.params['userip'] = '192.168.43.42' #find command to extract from client
        req.params['useragent'] = "Mozilla/5.0" #find command to extract from client
        req.params['q'] = params[:query]
        req.params['action'] = "employers"
      end

      if @resp.success?
        body = JSON.parse(@resp.body)
        companies = body["response"]["employers"]
        @exact_match = companies.select {|company| company["exactMatch"] == true}.first
        Company.create! name: @exact_match["name"], industry: @exact_match["industry"], website: @exact_match["website"], overall_rating: @exact_match["overallRating"], square_logo: @exact_match["squareLogo"], ceo_name: @exact_match["ceo"]["name"]
        render json: @exact_match #change this to update application company info
      else
        @error = body["meta"["errorDetail"]]
      end
      rescue Faraday::TimeoutError
        @error = "There was a timeout. Please try again."
      end

    end

end
