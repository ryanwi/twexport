require 'yaml'
require 'csv'

module Twexport

  class Exporter
    attr_accessor :client
    attr_accessor :users

    def initialize
      # configure twitter client
      config = YAML.load_file(File.expand_path(File.dirname(__FILE__) + '/../../config/config.yml'))

      @client = Twitter::Client.new(
        :consumer_key => config["consumer_key"],
        :consumer_secret => config["consumer_secret"],
        :oauth_token => config["oauth_token"],
        :oauth_token_secret => config["oauth_token_secret"]
      )
    end

    def save(path)
      CSV.open(path, "wb", {:force_quotes=>true}) do |csv|
        csv << ["name", "screen_name", "location", "url", "description", "followers", "following", "listed"]
        @users.each do |user|
          csv << [user[:name], user[:screen_name], user[:location], user[:url], user[:description], 
          user[:followers_count], user[:friends_count], user[:listed_count]]
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