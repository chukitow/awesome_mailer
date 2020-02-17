require 'spec_helper'

describe Providers::Sendgrid do
  let(:params) do
    {
      to: 'to@email.com',
      to_name: 'Ivan Velasquez',
      from: 'from@email.com',
      from_name: 'from',
      subject: 'Subject',
      body: '<p>Hello folks</p>'
    }
  end

  it 'sets mailgun api URL' do
    provider = Providers::Sendgrid.new(params)
    expect(provider.url).to eq('https://api.sendgrid.com/v3/mail/send')
  end

  it 'formats the parameters' do
    provider = Providers::Sendgrid.new(params)

    expect(provider.formated_params).to eq(
      "{
        \"personalizations\":
          [
            {
              \"to\":[
                {
                  \"email\":\"#{params[:to_name]} <#{params[:to]}>\"
                }
              ],
            \"subject\":\"#{params[:subject]}\"
          }],
        \"from\":{
          \"email\":\"#{params[:from_name]} <#{params[:from]}>\"
        },
        \"content\":[
          {
            \"type\":\"text/plain\",
            \"value\":\"Hello folks\"
          }
        ]
      }"
    )
  end
end
