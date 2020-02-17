require 'spec_helper'

describe Services::Mailer do
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

  it 'sets Mailgun as default provider' do
    service = Services::Mailer.new(params)
    expect(service.provider).to eq(Providers::Mailgun)
  end

  it 'retrieves error on invalid payload' do
    response = Services::Mailer.send(params.tap { |p| p.delete(:from) })
    expect(response).to eq({
      status: 422,
      errors: ["From can't be blank", "From is invalid"]
    })
  end

  it 'retrieves success on valid payload' do
    allow_any_instance_of(Providers::Mailgun).to receive(:send).and_return({ status: 200, body: {}})

    response = Services::Mailer.send(params)


    expect(response).to eq({
      body: {},
      status: 200
    })
  end
end
