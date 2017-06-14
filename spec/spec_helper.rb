require 'simplecov'
SimpleCov.start

require_relative 'support/controller_helpers'
require 'devise'
require 'factory_girl_rails'

RSpec.configure do |config|
  config.before(:all) do
    FactoryGirl.reload
  end

  config.include FactoryGirl::Syntax::Methods
  FactoryGirl.definition_file_paths = [File.expand_path('../factories', __FILE__)]

  config.include ControllerHelpers, type: :controller
  Warden.test_mode!
  config.after do
    Warden.test_reset!
  end

  config.expect_with :rspec do |expectations|

    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.filter_run :focus
  config.run_all_when_everything_filtered = true
  config.example_status_persistence_file_path = "spec/examples.txt"
  config.disable_monkey_patching!
  if config.files_to_run.one?
    config.default_formatter = 'doc'
  end
  config.order = :random
  Kernel.srand config.seed

end
