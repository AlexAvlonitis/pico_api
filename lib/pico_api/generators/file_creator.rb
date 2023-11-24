# frozen_string_literal: true

require 'fileutils'

module PicoApi
  module Generators
    class FileCreator
      def self.build(project_name)
        project_name_converter = ProjectNameConverter.new(project_name)
        erb_data_handler = ErbDataHandler.build(project_name_converter)

        new(project_name_converter, erb_data_handler)
      end

      def initialize(project_name_converter, erb_data_handler)
        @project_name_converter = project_name_converter
        @erb_data_handler = erb_data_handler
      end

      def create(template_file_path, destination_path)
        File.open("#{snakecased_name}#{destination_path}", 'w') do |file|
          create_interpolated_erb_file(template_file_path, file)
        end
      end

      private

      attr_reader :project_name_converter, :erb_data_handler

      def snakecased_name
        project_name_converter.snakecased
      end

      def create_interpolated_erb_file(template_file_path, file)
        source_path = template_full_file_path(template_file_path)

        erb_data_handler.write_to_file(source_path, file)
      end

      def template_full_file_path(template_relative_path)
        File.join(PicoApi.lib_path, template_relative_path)
      end
    end
  end
end
