require 'twitter'
require 'csv'


class Twexport
  def initialize(options = {})
    @client = Twitter::Client.new(
      :consumer_key => options[:consumer_key],
      :consumer_secret => options[:consumer_secret],
      :oauth_token => options[:oauth_token],
      :oauth_token_secret => options[:oauth_token_secret]
    )
  end

  def save(path)
    list = @client.list_members("screen_name", "list_slug")
    CSV.open(path, "wb", {:force_quotes=>true}) do |csv|
      csv << ["name", "screen_name", "location", "url", "description", "followers", "following", "listed"]
      list.users.each do |user|
        csv << [user[:name], user[:screen_name], user[:location], user[:url], user[:description], 
          user[:followers_count], user[:friends_count], user[:listed_count]]
      end
    end
  end
end


twexport = Twexport.new(:consumer_key => "",
  :consumer_secret => "",
  :oauth_token => "",
  :oauth_token_secret => "")
twexport.save('listname.csv')