require 'rest-client'
require 'nokogiri'

module Providers
  class Base
    def initialize(params)
      @params = params
    end

    def send
      response = RestClient.post(url, formated_params, headers)
      { status: response.code, body: (JSON.parse(response.body) rescue nil) }
    end

    def headers
      {}
    end

    def plain_body
      Nokogiri::HTML(@params[:body]).text
    end
  end
end
