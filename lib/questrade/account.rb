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

    def positions(id)
      get("/accounts/#{id}/positions")['position']
    end

    def executons(id)
      get("/accounts/#{id}/executions")['executions']
    end

    def balances(id)
      get("/accounts/#{id}/balances")
    end

    def activities(id)
      get("/accounts/#{id}/activities")['activities']
    end

    # FIXME: change to handle orderID
    def order(id, orderid = '')
      get("/accounts/#{id}/orders")['orders']
    end

  end
end