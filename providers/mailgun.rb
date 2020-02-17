module Providers
  class Mailgun < Base
    def url
      "https://api:#{ENV['mailgun_access_token']}@api.mailgun.net/v3/#{ENV['mailgun_domain']}/messages"
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
