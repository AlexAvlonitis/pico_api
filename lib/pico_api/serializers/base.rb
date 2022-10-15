# frozen_string_literal: true

require 'jsonapi/serializer'

module PicoApi
  module Serializers
    class Base
      include JSONAPI::Serializer
    end
  end
end
