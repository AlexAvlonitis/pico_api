# frozen_string_literal: true

module PicoApi
  module Entities
    class Errors < ROM::Struct
      class << self
        def call(error)
          class_name = error.class.name.demodulize
          error_entities = [
            Entities::Error.new(
              title: class_name.underscore,
              detail: error.message
            )
          ]
          new(errors: error_entities)
        end
      end

      attribute? :errors, ROM::Types::Array(Entities::Error)
    end
  end
end
