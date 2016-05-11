require "faraday"
require "json"

# update BASE_URL to match the server!!!!!
BASE_URL = "http://localhost:3004"
# update api_key to match!!!!!
API_KEY  = "918be40ab81d8162b7629547cdb7c40b1274aa9b8cf30873a73a227cdb0b93da"

conn = Faraday.new(url: BASE_URL) do |faraday|
  faraday.request  :url_encoded             # form-encode POST params
  faraday.response :logger                  # log requests to STDOUT
  faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
end

response = conn.get "/api/v1/campaigns", {api_key: API_KEY}

campaigns = JSON.parse(response.body)

campaigns.each do |campaign|
  puts campaign["title"]
end
