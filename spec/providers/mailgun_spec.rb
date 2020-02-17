require 'spec_helper'

describe Providers::Mailgun do
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
    provider = Providers::Mailgun.new(params)
    expect(provider.url).to eq('https://api:@api.mailgun.net/v3//messages')
  end

  it 'formats the parameters' do
    provider = Providers::Mailgun.new(params)

    expect(provider.formated_params).to eq({
      from: "from <from@email.com>",
      subject: "Subject",
      text: "Hello folks",
      to: "Ivan Velasquez <to@email.com>"
    })
  end
end
