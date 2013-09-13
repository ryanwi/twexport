require_relative '../spec_helper'

describe Twexport::TwitterList do 
  it "requests list by screen name and slug" do
    twexport = Twexport::TwitterList.new(:screen_name => "rails", :list_slug => "core",
      :consumer_key => CONSUMER_KEY, 
      :consumer_secret => CONSUMER_SECRET, 
      :access_token => ACCESS_TOKEN, 
      :access_token_secret => ACCESS_TOKEN_SECRET)
    twexport.save("rails_core_slug.csv")
  end

  it "requests list by id" do
    twexport = Twexport::TwitterList.new(:list_id => 4447,
      :consumer_key => CONSUMER_KEY, 
      :consumer_secret => CONSUMER_SECRET, 
      :access_token => ACCESS_TOKEN, 
      :access_token_secret => ACCESS_TOKEN_SECRET)
    twexport.save("rails_core_id.csv")
  end
end