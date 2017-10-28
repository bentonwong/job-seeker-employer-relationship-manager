class Company < ApplicationRecord
  has_many :application_company_relationships, class_name: ApplicationCompanyRelationship
  has_many :applications, through: :application_company_relationships

  def self.set_query_params(req, query, ip, user_agent)
    req.params['v'] = 1
    req.params['format'] = "json"
    req.params['t.p'] = ENV["GLASSDOOR_PARTNER_ID"]
    req.params['t.k'] = ENV["GLASSDOOR_KEY"]
    req.params['userip'] = ip
    req.params['useragent'] = user_agent
    req.params['q'] = query
    req.params['action'] = "employers"
  end

  def self.save_api_results(companies)
    exact_match = companies.select {|company| company["exactMatch"] == true}.first
    if exact_match
      new_company = Company.find_or_create_by(name: exact_match["name"]) do |company|
        company.industry = exact_match["industry"]
        company.website = exact_match["website"]
        company.overall_rating = exact_match["overallRating"]
        company.square_logo = exact_match["squareLogo"]
        company.ceo_name = exact_match["ceo"]["name"]
      end
    end
  end

  def self.search(params, ip, user_agent)
    begin
      resp = Faraday.get "http://api.glassdoor.com/api/api.htm?" do |req|
        Company.set_query_params(req, params[:query], ip, user_agent)
      end
      if resp.success?
        body = JSON.parse(resp.body)
        companies = body["response"]["employers"]
        app_company = Company.save_api_results(companies)
        @application = Application.find_by(id: params[:application_id])
        @application.company = app_company if app_company
      end
    end
  end

end
