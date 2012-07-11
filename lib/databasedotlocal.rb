require "databasedotlocal/version"
require "databasedotlocal/app"

module Databasedotlocal
  class << self

    def app
      @app ||= Rack::Builder.new {
        run Databasedotlocal::App
      }
    end

  end
end
