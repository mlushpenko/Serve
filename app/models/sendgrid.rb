#PipeDrive
class Sendgrid
  include HTTParty
  base_uri 'sendgrid.com'

  def self.statistics
     response = get "/api/stats.get.json?api_user=app2562834@heroku.com&api_key=drlr9v9x&days=10" 
     YAML.load(response).map{|e| HashWithIndifferentAccess.new(e)}
  end 

end