# frozen_string_literal: true

require 'rom'
require 'rom-sql'

module PicoApi
  class Database
    class << self
      attr_accessor :container

      def setup!
        database_config = PicoApi.configuration.db_config['default']
        adapter = database_config['adapter'].to_sym
        options = database_config['options'].symbolize_keys
        connection_string = database_config['connection_string']

        config = ROM::Configuration.new(adapter, connection_string, options)
        yield config if block_given?

        @container = ROM.container(config)
      end
    end
  end
end
