module Providers
  class Mailgun < Base
    def url
      "https://api:#{ENV['MAILGUN_ACCESS_TOKEN']}@api.mailgun.net/v3/#{ENV['MAILGUN_DOMAIN']}/messages"
    end

    def formated_params
      {
        from: "#{@params[:from_name]} <#{@params[:from]}>",
        to: "#{@params[:to_name]} <#{@params[:to]}>",
      	subject: @params[:subject],
      	text: plain_body
      }
    end
  end
end
