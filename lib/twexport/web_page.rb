require 'nokogiri'
require 'open-uri'

module Twexport

  # Exporter that scrapes a web page for Twitter usernames to lookup on Twitter
  class WebPage < Exporter

    def initialize(options = {})
      @url = options[:url]
      super(options)
    end

    # Execute the export and save the result
    def save(path)
      usernames = extract_names
      @users = lookup_users usernames
      super
    end

    private

    # For a web page, find all twitter links and pull out the usernames
    def extract_names
      names = []
      doc = Nokogiri::HTML(open(@url))

      tw_links = doc.xpath('//a[contains(@href, "twitter.com/")]')
      tw_links.each do |link|
        # http://twitter.com/jack
        # https://twitter.com/jack/status/20
        # http://twitter.com/@jack
        # http://www.twitter.com/#!/jack

        match = /^https?:\/\/(?:www\.)?twitter\.com\/(?:#!\/)?@?(?<name>[^\/]+)/i.match(link["href"])
        unless match.nil?
          names << match[:name]
        end
      end

      if tw_links.count == 0
        # http://a16z.com/team/
        tw_attributes = doc.xpath("//*[@twitter]") #get all elements with an attribute of 'twitter'
        tw_attributes.each do |attribute|
          name = attribute.attr("twitter")
          names << name.sub("@", "") unless name.empty?
        end
      end

      names.uniq
    end

  end

end
