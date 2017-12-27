require 'simplecov'
require 'rspec/json_expectations'

SimpleCov.start 'rails' do
  add_filter do |source_file|
    source_file.lines.count < 5
  end
  add_filter '/.bundle/'
  add_filter '/spec/'
  add_filter '/config/'

  add_group 'Models', 'app/models'
  add_group 'Controllers', 'app/controllers'
  add_group 'Services', 'app/services'
  add_group 'Helpers', 'app/helpers'
  add_group 'Lib', 'lib'
  add_group 'Mailers', 'app/mailers'
end

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end
end
