# frozen_string_literal: true

require 'fileutils'
require 'erb'

module PicoApi
  module Generators
    class FileCreator
      def self.build(project_name)
        project_name_data_mapper = ProjectNameDataMapper.new(project_name)

        new(project_name_data_mapper)
      end

      def initialize(project_name_data_mapper)
        @project_name_data_mapper = project_name_data_mapper
      end

      def create(template_file_path, destination_path)
        File.open("#{snakecased_name}#{destination_path}", 'w') do |file|
          file.write(template(template_file_path))
        end
      end

      private

      attr_reader :project_name_data_mapper

      def snakecased_name
        project_name_data_mapper.snakecased
      end

      def template(template_file_path)
        erb(template_file_path).result(project_name_data_mapper.get_binding)
      end

      def erb(template_file_path)
        source_file = File.read(template_full_file_path(template_file_path))
        ERB.new(source_file)
      end

      def template_full_file_path(template_relative_path)
        File.join(PicoApi.lib_path, template_relative_path)
      end
    end
  end
end
