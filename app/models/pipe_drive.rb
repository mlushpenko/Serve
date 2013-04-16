#PipeDrive
class PipeDrive
  include HTTParty
  base_uri 'api.pipedrive.com'

  def self.activities
     get "/v1/persons/1/activities?start=0&api_token=f8cc3e7ae3c3b943d611fd31bbf22036f0d4c145" 
  end 

end



