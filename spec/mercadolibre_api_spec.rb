require 'rest-client'
require 'json'

RSpec.describe "Functional testing (advanced)" do

  it "Users api" do
    response = JSON.parse(RestClient.get("https://api.mercadolibre.com/users/1").body)
    expect(response["id"]).to eq(1)
    expect(response["country_id"]).to eq("CL")
    expect(response["tags"]).to include("test_user")
    expect(response["seller_reputation"]["transactions"]["ratings"]["neutral"]).to eq(0)
  end

end