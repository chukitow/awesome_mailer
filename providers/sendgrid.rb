require 'nokogiri'

module Providers
  class Sendgrid < Base
    def url
      'https://api.sendgrid.com/v3/mail/send'
    end

    def formated_params
      #NOTE: to_json is not working as expected
      "{
        \"personalizations\":
          [
            {
              \"to\":[
                {
                  \"email\":\"#{@params[:to_name]} <#{@params[:to]}>\"
                }
              ],
            \"subject\":\"#{@params[:subject]}\"
          }],
        \"from\":{
          \"email\":\"#{@params[:from_name]} <#{@params[:from]}>\"
        },
        \"content\":[
          {
            \"type\":\"text/plain\",
            \"value\":\"#{plain_body}\"
          }
        ]
      }"
    end

    def headers
      {
        content_type: "application/json",
        authorization: "Bearer #{ENV['SENGRID_ACCESS_TOKEN']}"
      }
    end
  end
end
