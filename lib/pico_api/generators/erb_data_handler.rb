# frozen_string_literal: true

require 'fileutils'
require 'erb'

module PicoApi
  module Generators
    class ErbDataMapper
      def initialize(project_name_converter)
        @snakecased_name = project_name_converter.snakecased
        @camelcased_name = project_name_converter.camelcased
      end

      def get_binding
        binding
      end
    end

    class ErbDataHandler
      def self.build(project_name_converter)
        new(ErbDataMapper.new(project_name_converter))
      end

      def initialize(erb_data_mapper)
        @erb_data_mapper = erb_data_mapper
      end

      def write_to_file(template_full_file_path, file)
        file.write(
          erb_template_file(template_full_file_path)
            .result(erb_data_mapper.get_binding)
        )
      end

      private

      attr_reader :erb_data_mapper

      def erb_template_file(template_full_file_path)
        ERB.new(File.read(template_full_file_path))
      end
    end
  end
end
