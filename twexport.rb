require 'twitter'
require 'yaml'
require 'csv'


class Twexport
  def initialize(options = {})
    @list_id = options[:list_id]
    @screen_name = options[:screen_name]
    @list_slug = options[:list_slug]
    @client = Twitter::Client.new

    # Load config for Twitter gem
    config = YAML.load_file("config.yml")
    config.keys.each {|key| ENV[key] = config[key]}
  end

  def save(path)
    list = @client.list_members(@screen_name, @list_slug)
    CSV.open(path, "wb", {:force_quotes=>true}) do |csv|
      csv << ["name", "screen_name", "location", "url", "description", "followers", "following", "listed"]
      list.users.each do |user|
        csv << [user[:name], user[:screen_name], user[:location], user[:url], user[:description], 
          user[:followers_count], user[:friends_count], user[:listed_count]]
      end
    end
  end
end

twexport = Twexport.new(:screen_name => "", :list_slug => "")
twexport.save('list.csv')