module Services
  class Mailer
    attr_reader :provider

    def self.send(params)
      new(params).send
    end

    def initialize(params)
      @params = params
      @provider = Providers::Mailgun
      @validator = Validators::Email.new(params)
    end

    def send
      return { status: 422, errors: @validator.errors.full_messages } unless @validator.valid?
      @provider.new(@params).send
    end
  end
end
