require 'twitter'

module Twexport

  # Exporter that can call Twitter Lists API
  class TwitterList < Exporter

    def initialize(options = {})
      @list_id = options[:list_id]
      @screen_name = options[:screen_name]
      @list_slug = options[:list_slug]
      super(options)
    end

    # Execute the Twitter List API call and save the result
    def save(path)
      @users = get_members
      super
    end

    private

    def get_members
      list_args = @list_id.nil? ? [@screen_name, @list_slug] : @list_id
      members = (@client.list_members *list_args).to_a
      members.flatten
    end
  end
end
