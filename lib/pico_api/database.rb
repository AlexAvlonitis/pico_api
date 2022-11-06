# frozen_string_literal: true

require 'rom'
require 'rom-sql'

module PicoApi
  class Database
    class << self
      attr_accessor :container

      def setup!
        database_config = PicoApi.configuration.db_config.deep_symbolize_keys
        logger = PicoApi.configuration.logger
        gateways = database_config.keys

        configs = create_config(gateways, database_config)
        cont = ROM.container(**configs) { |config| yield config if block_given? }

        gateways.each { |gateway| cont.gateways[gateway].use_logger(logger) } if logger

        @container = cont
      end

      private

      def create_config(gateways, database_config)
        gateways.inject({}) do |memo, gateway|
          adapter = database_config.dig(gateway, :adapter)&.to_sym
          options = database_config.dig(gateway, :options)
          connection_string = database_config.dig(gateway, :connection_string)

          memo[gateway] = [adapter, connection_string, **options]
          memo
        end
      end
    end
  end
end
