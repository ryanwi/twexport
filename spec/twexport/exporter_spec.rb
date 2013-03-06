require File.dirname(__FILE__) + '/../spec_helper'

describe Twexport::Exporter do 
  it "initializes with config" do
    twexport = Twexport::Exporter.new
  end

  it "looks up single user in Twitter API" do
    twexport = Twexport::Exporter.new
    twexport.lookup_users ['ryanwi']
  end

  it "looks up users in Twitter API" do
    twexport = Twexport::Exporter.new
    twexport.lookup_users ['corybooker','lolojones','xeni']
  end
end