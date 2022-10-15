# frozen_string_literal: true

module PicoApi
  module Handlers
    class Errors
      def self.call(error, response)
        exception_key = error.class.name.demodulize.to_sym
        status = PicoApi.configuration.errors_map[exception_key]
        return system_error(error, response) unless status

        response.status = status
        Entities::Errors.call(error).to_h
      end

      ServerError = Struct.new(:message)
      def self.system_error(error, response)
        response.status = :internal_server_error
        error = ServerError.new('Something went wrong, we are investigating')
        Entities::Errors.call(error).to_h
      end
    end
  end
end
