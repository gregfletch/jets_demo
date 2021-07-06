# frozen_string_literal: true

source 'https://rubygems.org'

ruby '2.7.3'

gem 'dynomite'
gem 'jets', '~> 3.0.0'
gem 'logstop'

# development and test groups are not bundled as part of the deployment
group :development, :test do
  gem 'brakeman'
  gem 'bundler-audit'
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'puma'
  gem 'rack'
  gem 'rubocop'
  gem 'rubocop-performance'
  gem 'rubocop-rails'
  gem 'rubocop-rspec'
  gem 'rubocop_runner'
  gem 'shotgun'
end

group :test do
  gem 'factory_bot'
  gem 'faker'
  gem 'rspec' # rspec test group only or we get the "irb: warn: can't alias context from irb_context warning" when starting jets console
  gem 'simplecov'
end
