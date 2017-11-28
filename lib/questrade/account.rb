module Questrade
  module Account
      # Retrieves current server time.
      # @return [DateTime] Current server time in ISO format and Eastern time zone.
      # client.time
    def time
      DateTime.parse(get('/time')['time'])
    end

    def accounts
      get('/accounts')['accounts']
    end

    def positions
  end
end