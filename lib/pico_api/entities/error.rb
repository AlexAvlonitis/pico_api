# frozen_string_literal: true

require 'securerandom'

module PicoApi
  module Entities
    class Error < ROM::Struct
      attribute? :title, ROM::Types::String
      attribute? :status, ROM::Types::String.optional
      attribute? :code, ROM::Types::String.optional
      attribute? :detail, ROM::Types::String.optional

      def to_h
        id.merge(super)
      end

      def id
        { id: SecureRandom.hex(5) }
      end
    end
  end
end
