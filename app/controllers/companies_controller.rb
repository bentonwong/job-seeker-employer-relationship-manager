class CompaniesController < ApplicationController

  def index
    @companies = Company.all
  end

  def create
    #company_name = params[company_name]
    #results = fetch data from api company name
    #http://api.glassdoor.com/api/api.htm?t.p={GLASSDOOR_PARTNER_ID}&t.k=GLASSDOOR_KEY&userip=0.0.0.0&useragent=&format=json&v=1&action=employers
    #@company = results
  end

  def update
  end

end
