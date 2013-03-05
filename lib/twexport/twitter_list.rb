require 'twitter'
require 'yaml'
require 'csv'

module Twexport

  # Exporter that can call Twitter Lists API
  class TwitterListExporter < Exporter

    def save
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