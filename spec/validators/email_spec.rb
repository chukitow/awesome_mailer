require 'spec_helper'

describe Validators::Email do
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

  it 'validates presence of "to"' do
    validator = Validators::Email.new(params.tap { |p| p.delete(:to) })
    validator.valid?

    expect(validator.errors.full_messages).to eq(["To can't be blank", "To is invalid"])
  end

  it 'validates presence of "from"' do
    validator = Validators::Email.new(params.tap { |p| p.delete(:from) })
    validator.valid?

    expect(validator.errors.full_messages).to eq(["From can't be blank", "From is invalid"])
  end

  it 'validates presence of "from_name"' do
    validator = Validators::Email.new(params.tap { |p| p.delete(:from_name) })
    validator.valid?

    expect(validator.errors.full_messages).to eq(["From name can't be blank"])
  end

  it 'validates presence of "subject"' do
    validator = Validators::Email.new(params.tap { |p| p.delete(:subject) })
    validator.valid?

    expect(validator.errors.full_messages).to eq(["Subject can't be blank"])
  end

  it 'validates presence of "body"' do
    validator = Validators::Email.new(params.tap { |p| p.delete(:body) })
    validator.valid?

    expect(validator.errors.full_messages).to eq(["Body can't be blank"])
  end
end
