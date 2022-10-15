# frozen_string_literal: true

require 'erb'
require 'yaml'

module PicoApi
  class << self
    def configuration
      @configuration ||= Configuration.new(db_config)
    end

    def db_config
      template = ERB.new(File.new('./config/database.yml').read)
      YAML.safe_load(template.result(binding))
    end

    def configure
      yield(configuration)
    end
  end

  class Configuration
    attr_reader :db_config
    attr_accessor :namespace, :lib_path, :errors_map

    def initialize(db_config)
      @db_config = db_config
    end
  end
end
