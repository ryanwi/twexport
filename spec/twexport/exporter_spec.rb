require_relative '../spec_helper'

describe Twexport::Exporter do 
  it "initializes with config" do
    twexport = Twexport::Exporter.new(:consumer_key => '', 
      :consumer_secret => '', 
      :oauth_token => '', 
      :oauth_token_secret => '')
  end

  it "looks up single user in Twitter API" do
    twexport = Twexport::Exporter.new(:consumer_key => '', 
      :consumer_secret => '', 
      :oauth_token => '', 
      :oauth_token_secret => '')
    users = twexport.lookup_users ['ryanwi']
    # puts users.inspect
  end

  it "looks up users in Twitter API" do
    twexport = Twexport::Exporter.new(:consumer_key => '', 
      :consumer_secret => '', 
      :oauth_token => '', 
      :oauth_token_secret => '')
    users = twexport.lookup_users ['corybooker','lolojones','xeni']
    # puts users.inspect
  end
end