require 'dotenv/load'
require 'sinatra'
require 'sinatra/contrib'

require_relative 'validators/email'
require_relative 'providers/base'
require_relative 'providers/mailgun'
require_relative 'providers/sendgrid'
require_relative 'services/mailer'

class App < Sinatra::Base
  include Sinatra::JSON

  before do
    content_type :json

    headers['Access-Control-Allow-Methods'] = 'GET, POST, PUT, DELETE, OPTIONS'
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Allow-Headers'] = 'accept, authorization, origin'
  end

  options '*' do
    response.headers['Allow'] = 'HEAD,GET,PUT,DELETE,OPTIONS,POST'
    response.headers['Access-Control-Allow-Headers'] = 'X-Requested-With, X-HTTP-Method-Override, Content-Type, Cache-Control, Accept'
  end


  post '/email' do
    response = Services::Mailer.send(params)
    status response[:status]
    json response
  end
end
