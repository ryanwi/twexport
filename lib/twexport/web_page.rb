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
      doc = Nokogiri::HTML(open(@url))
      twitter_links = doc.xpath('//a[contains(@href, "twitter.com/")]')

      names = []
      twitter_links.each do |link|
        # http://twitter.com/jack
        # https://twitter.com/jack/status/20
        # http://twitter.com/@jack
        # http://www.twitter.com/#!/jack

        match = /^https?:\/\/(?:www\.)?twitter\.com\/(?:#!\/)?@?(?<name>[^\/]+)/i.match(link["href"])
        unless match.nil?
          names << match[:name]
        end
      end

      names.uniq
    end

  end

end