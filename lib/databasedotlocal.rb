require "databasedotlocal/version"
require "databasedotlocal/database"
require "databasedotlocal/app"

module Databasedotlocal
  class << self
    attr_accessor :schema_path

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

    def schema_path
      @schema_path || raise("Please set the schema path")
    end

  end
end
