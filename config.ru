# frozen_string_literal: true

require_relative "./config/environment"

use Rack::Ougai::LogRequests, Application.logger

map "/ads" do
  run AdsRoutes.new
end
