require 'spec_helper'

describe Providers::Base do
  it 'formats body parameter into plain text' do
    provider = Providers::Base.new({ body: '<h1>Hello</h1>'})

    expect(provider.plain_body).to eq('Hello')
  end
end
