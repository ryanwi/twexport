require_relative '../spec_helper'

describe Twexport::Exporter do 
  before :each do
    @twexport = Twexport::Exporter.new(
      :consumer_key => CONSUMER_KEY, 
      :consumer_secret => CONSUMER_SECRET, 
      :access_token => ACCESS_TOKEN, 
      :access_token_secret => ACCESS_TOKEN_SECRET)
  end

  it "initializes with twitter keys" do
  end

  it "looks up single user in Twitter API" do
    users = @twexport.lookup_users ['ryanwi']
  end

  it "looks up multiple users in Twitter API" do
    users = @twexport.lookup_users ['corybooker','lolojones','xeni']
  end
end