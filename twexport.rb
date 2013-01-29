require 'twitter'
require 'yaml'
require 'csv'


class Twexport
  def initialize(options = {})
    @list_id = options[:list_id]
    @screen_name = options[:screen_name]
    @list_slug = options[:list_slug]

    config = YAML.load_file("config.yml")

    @client = Twitter::Client.new(
      :consumer_key => config["consumer_key"],
      :consumer_secret => config["consumer_secret"],
      :oauth_token => config["oauth_token"],
      :oauth_token_secret => config["oauth_token_secret"]
    )
  end

  def save(path)
    unless @list_id.nil?
      list = @client.list_members(@list_id)
    else
      list = @client.list_members(@screen_name, @list_slug)
    end

    # TODO: handle cursor for bigger lists

    CSV.open(path, "wb", {:force_quotes=>true}) do |csv|
      csv << ["name", "screen_name", "location", "url", "description", "followers", "following", "listed"]
      list.users.each do |user|
        csv << [user[:name], user[:screen_name], user[:location], user[:url], user[:description], 
          user[:followers_count], user[:friends_count], user[:listed_count]]
      end
    end
  end
end


# By screen name and slug
twexport = Twexport.new(:screen_name => "rails", :list_slug => "core")
twexport.save('core.csv')

# By ID
# twexport = Twexport.new(:list_id => 574)
# twexport.save('team.csv')
