require 'rspec'
require_relative '../twexport.rb'

describe Twexport do 
	it "exports profile information from a twitter list to a file" do
	  twexport = Twexport.new
	  twexport.save("list.csv")
	end
end