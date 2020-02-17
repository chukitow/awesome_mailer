require 'active_model'

module Validators
  class Email
    include ActiveModel::Validations

    attr_accessor :to, :to_name, :from, :from_name, :subject, :body

    validates :to, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
    validates :to_name, presence: true
    validates :from, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
    validates :from_name, presence: true
    validates :subject, presence: true
    validates :body, presence: true

    def initialize(params = {})
      params.each do |key, value|
        instance_variable_set("@#{key}", value) if respond_to? "#{key.to_s}=".to_sym
      end
    end
  end
end
