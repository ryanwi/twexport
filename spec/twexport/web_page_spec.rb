require_relative '../spec_helper'

describe Twexport::WebPage do
  it "finds 1 twitter username to extract"  do
    twexport = Twexport::WebPage.new 'http://www.ryan-williams.net'
    names = twexport.send(:extract_names)
    names.count.should == 1
    names.first.should == 'ryanwi'
  end

  it "saves list with 1 member extracted from web page" do
    twexport = Twexport::WebPage.new 'http://www.ryan-williams.net'
    twexport.save("webpage_export.csv")
  end

end