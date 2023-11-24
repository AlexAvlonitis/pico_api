# frozen_string_literal: true

module PicoApi
  module Generators
    class ProjectNameDataMapper
      attr_reader :camelcased, :snakecased

      def initialize(project_name)
        @camelcased = project_name.camelize
        @snakecased = project_name.underscore
      end

      def get_binding
        binding
      end
    end
  end
end
