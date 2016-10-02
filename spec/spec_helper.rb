ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rspec/rails'

Dir[Rails.root.join('spec/support/**/*.rb')].each { |f| require f }

ActiveRecord::Migration.check_pending! if defined?(ActiveRecord::Migration)

Rails.application.routes.default_url_options[:host] = 'test.davidkind.com'

RSpec.configure do |config|
  config.include Devise::TestHelpers, type: :controller
  config.include ControllerMacros, type: :controller

  config.use_transactional_fixtures = false
  config.order = 'random'
  config.infer_spec_type_from_file_location!

  config.filter_run focus: true
  config.run_all_when_everything_filtered = true

  config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)
  end

  config.around(:each) do |example|
    DatabaseCleaner.cleaning { example.run }
  end
end