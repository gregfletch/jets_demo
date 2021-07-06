# frozen_string_literal: true

ENV['JETS_TEST'] = '1'
ENV['JETS_ENV'] ||= 'test'

require 'byebug'
require 'factory_bot'
require 'fileutils'
require 'jets'
require 'simplecov'

# Ensures AWS API never called. Fixture home folder does not contain ~/.aws/credentials
ENV['HOME'] = Jets.root.join('spec', 'fixtures', 'home').to_s

abort('The Jets environment is running in production mode!') if Jets.env == 'production'
Jets.boot

require 'jets/spec_helpers'

module Helpers
  def payload(name)
    JSON.parse(IO.read("spec/fixtures/payloads/#{name}.json"))
  end
end

RSpec.configure do |c|
  c.include FactoryBot::Syntax::Methods
  FactoryBot.find_definitions

  c.include Helpers
end
