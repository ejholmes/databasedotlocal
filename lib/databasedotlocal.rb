require "databasedotlocal/version"
require "databasedotlocal/database"
require "databasedotlocal/app"

module Databasedotlocal
  class << self

    def app
      @app ||= Rack::Builder.new {
        run Databasedotlocal::App
      }
    end

    def storage
      Database.storage
    end

    def clean!
      Database.clean!
    end

  end
end
