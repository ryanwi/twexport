require 'rspec'
require_relative '../twexport.rb'

describe Twexport do 
  it "initializes with config" do
    twexport = Twexport.new
  end

  it "requests list by screen name and slug" do
    twexport = Twexport.new(:screen_name => "rails", :list_slug => "core")
    twexport.save("rails_core.csv")
  end

  it "requests list by id" do
    twexport = Twexport.new(:list_id => 574)
    twexport.save("twitter_team.csv")
  end
end