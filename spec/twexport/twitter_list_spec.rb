require File.dirname(__FILE__) + '/../spec_helper'

describe Twexport::TwitterList do 
  it "initializes with config" do
    twexport = Twexport::TwitterList.new
  end

  it "requests list by screen name and slug" do
    twexport = Twexport::TwitterList.new(:screen_name => "rails", :list_slug => "core")
    twexport.save("rails_core.csv")
  end

  # it "requests list by id" do
  #   twexport = Twexport::TwitterList(:list_id => 574)
  #   twexport.save("twitter_team.csv")
  # end
end