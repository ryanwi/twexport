require 'twitter'

module Twexport

  # Exporter that can call Twitter Lists API
  class TwitterList < Exporter

    def initialize(options = {})
      @list_id = options[:list_id]
      @screen_name = options[:screen_name]
      @list_slug = options[:list_slug]
      super()
    end

    # Execute the Twitter List API call and save the result
    def save(path)
      @users = get_members
      super
    end


    private

    def get_members 
      cursor = -1
      members = []
      list_args = @list_id.nil? ? [@screen_name, @list_slug] : @list_id

      while cursor != 0 do
        sleep rand(5) if cursor > 0
        members_page = @client.list_members *list_args, {:cursor=>cursor}
        cursor = members_page.next_cursor
        members << members_page.users
      end

      members.flatten
    end
  end

end