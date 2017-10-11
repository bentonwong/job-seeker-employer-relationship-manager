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
        req.params['userip'] = '192.168.43.42' #find command to extract from client
        req.params['useragent'] = "Mozilla/5.0" #find command to extract from client
        req.params['q'] = params[:query]
        req.params['action'] = "employers"
      end
      body = JSON.parse(@resp.body)
      if @resp.success?
        @company = body["response"]["employers"]
      else
        @error = body["meta"["errorDetail"]]
      end
      rescue Faraday::TimeoutError
        @error = "There was a timeout. Please try again."
      end
      render json: @company
    end

end
