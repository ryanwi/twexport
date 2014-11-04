require 'twitter'
require 'yaml'
require 'csv'

module Twexport

  class Exporter
    attr_accessor :client
    attr_accessor :users

    def initialize(options = {})
      # configure twitter client
      @client = Twitter::REST::Client.new do |config|
        config.consumer_key        = options[:consumer_key]
        config.consumer_secret     = options[:consumer_secret]
        config.access_token        = options[:access_token]
        config.access_token_secret = options[:access_token_secret]
      end
    end

    def save(path)
      CSV.open(path, "wb", {:force_quotes=>true}) do |csv|
        csv << ["name", "screen_name", "location", "website", "description", "followers", "following", "listed"]
        @users.each do |user|
          csv << [user.name, user.screen_name, user.location.to_s, user.website.to_s, user.description.to_s, user.followers_count, user.friends_count, user.listed_count]
        end
      end
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
