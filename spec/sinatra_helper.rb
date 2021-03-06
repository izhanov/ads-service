# frozen_string_literal: true

require "spec_helper"

ENV["RACK_ENV"] ||= "test"

require_relative "../config/environment"

abort("The Sinatra environment is running in production mode!") if Application.environment == :production

Dir[Application.root.concat("/spec/helpers/**/*.rb")].each { |f| require f }

begin
  ActiveRecord::Migration.maintain_test_schema!
rescue ActiveRecord::PendingMigrationError => e
  puts e.to_s.strip
  exit 1
end

require "rack/test"
require "factory_bot"
require "byebug"

RSpec.configure do |config|
  config.include Rack::Test::Methods
  config.include Features::RoutesHelper
  config.include Features::ClientHelper, type: :client
  config.include FactoryBot::Syntax::Methods

  config.before(:suite) do
    FactoryBot.find_definitions
  end
end
