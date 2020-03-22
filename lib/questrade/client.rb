require 'questrade/account'
require 'faraday'

module Questrade

  def self.login(token)
    url = "https://login.questrade.com/oauth2/"

    connect = Faraday.new @endpoint do |f|
      f.headers[:user_agent] = Questrade::USER_AGENT
      f.headers['Content-length'] = '0'
      f.response :json, content_type: /\bjson$/
      f.adapter Faraday.default_adapter
    end
    endpoint = "#{url}token?grant_type=refresh_token&refresh_token=#{refresh_token}"
    res = connect.send(:post, endpoint)

    if r.success?
      puts "Refresh token: #{res.body['refresh_token']}"
      endpoint = res.body['api_server']
      token = res.body['access_token']
      return Client.new(endpoint: endpoint, token: token)
    else
      puts "Login failed! Error Message: "
      puts r.body
      return nil
    end
  end

  class Client

    # allows token and endpoint to be read from object
    attr_reader :endpoint, :token

    def initialize(options = {})
      @endpoint = options[:endpoint].to_s
      @token = options[:token].to_s
    end

    include Questrade::Account

    def connect
      @connect ||= Faraday.new @endpoint do |f|
        f.request :json
        f.headers[:user_agent] = Questrade::USER_AGENT
        f.headers['Authorization'] = "Bearer #{@token}"
        f.response :mashify
        f.response :json, content_type: /\bjson$/
        f.adapter Faraday.default_adapter
      end
    end

    def req(method, path, data = {})
      result = connect.send(method, "v1/#{path}", data)
      if result.success? && !result.body.blank
        result.body
      else
        result
      end
    end

    def get(path)
      return path
    end

    def post(path)
      return path
    end

    def put(path)
      return path
    end



  end

end
