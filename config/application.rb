# frozen_string_literal: true

require "bunny"
require "sinatra/activerecord"
require "sinatra/base"
require "sinatra/contrib"
require "dry/monads"
require "dry/monads/result"
require "dry/validation"
require "fast_jsonapi"
require "faraday"
require "faraday_middleware"

class Application < Sinatra::Base
  include Dry::Monads[:result]

  configure do
    register Sinatra::Namespace
    set :app_file, File.expand_path("../config.ru", __dir__)
  end

  configure :development do
    register Sinatra::Reloader

    set :show_exceptions, false
  end
end
