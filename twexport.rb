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
    members = get_members

    CSV.open(path, "wb", {:force_quotes=>true}) do |csv|
      csv << ["name", "screen_name", "location", "url", "description", "followers", "following", "listed"]
      members.each do |user|
        csv << [user[:name], user[:screen_name], user[:location], user[:url], user[:description], 
          user[:followers_count], user[:friends_count], user[:listed_count]]
      end
    end
  end

  private

  def get_members 
    cursor = -1
    members = []

    #TODO: DRY

    unless @list_id.nil?
      while cursor != 0 do
        sleep rand(5) if cursor > 0
        members_page = @client.list_members(@list_id, {:cursor=>cursor})
        cursor = members_page.next_cursor
        members << members_page.users
      end
    else
      while cursor != 0 do
        sleep rand(5) if cursor > 0
        members_page = @client.list_members(@screen_name, @list_slug, {:cursor=>cursor})
        cursor = members_page.next_cursor
        members << members_page.users
      end
    end

    members.flatten
  end
end


# By screen name and slug
twexport = Twexport.new(:screen_name => "rails", :list_slug => "core")
twexport.save('core.csv')

# By ID
# twexport = Twexport.new(:list_id => 574)
# twexport.save('team.csv')
