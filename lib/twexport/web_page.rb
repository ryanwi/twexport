require 'nokogiri'
require 'open-uri'
require 'twitter'
require 'uri'

module Twexport

  # Exporter that scrapes a web page for Twitter usernames to lookup on Twitter
  class WebPageExporter < Exporter

    def save
    	usernames = extract_names
			@users = lookup_users usernames
			super
    end


    private

    def extract_names
    	doc = Nokogiri::HTML(open(@url))
			twitter_links = doc.xpath('//a[contains(@href, "twitter.com/")]')

			names = []
			twitter_links.each do |link|

				# http://twitter.com/jack
				# http://twitter.com/@jack
				# http://www.twitter.com/#!/jack
				# ^https?:\/\/(www\.)?twitter\.com\/(#!\/)?(?<name>[^\/]+)(\/\w+)*$
				# ^https?://(www\.)?twitter\.com/(#!/)?([^/]+)(/\w+)*$
				# /https?:\/\/(www\.)?twitter\.com\/(#!\/)?@?([^\/]*)/
				# /https?:\/\/(www.)?twitter.com/.*/.match link["href"]
				# /^https?:\/\/(www\.)?twitter\.com/(#!/)?(?<name>[^/]+)(/\w+)*$/.match 
				# uri = URI(link["href"]).fragment
				# path = URI(link["href"]).path
				# names << path.gsub(/[\/@]/, '')
			end

			names
    end

    # https://dev.twitter.com/docs/api/1.1/get/users/lookup
    # https://github.com/sferik/twitter/blob/master/lib/twitter/api/users.rb#L236
    def lookup_users(usernames)
    	#TODO: handle more than 100
    	# Only retrieves up to 100 at a time
    	users = @client.users(usernames)
    end

  end

end