require 'twexport/twitter_list'
require 'twexport/webpage'

module Twexport

  class Exporter

    def save
      CSV.open(path, "wb", {:force_quotes=>true}) do |csv|
        csv << ["name", "screen_name", "location", "url", "description", "followers", "following", "listed"]
        @users.each do |user|
          csv << [user[:name], user[:screen_name], user[:location], user[:url], user[:description], 
          user[:followers_count], user[:friends_count], user[:listed_count]]
        end
      end
    end

  end

end