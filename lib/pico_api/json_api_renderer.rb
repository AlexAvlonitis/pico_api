# frozen_string_literal: true

module PicoApi
  module JsonApiRenderer
    def serialize(resource, **opts)
      serializer_klass = opts.delete(:serializer)
      serializer = serializer_klass.new(resource, opts)
      serializer.serializable_hash
    end
  end
end
