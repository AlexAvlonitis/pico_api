# frozen_string_literal: true

require 'fileutils'

module PicoApi
  module Generators
    class FileCopier
      def self.build(project_name)
        project_name_data_mapper = ProjectNameDataMapper.new(project_name)

        new(project_name_data_mapper)
      end

      def initialize(project_name_data_mapper)
        @project_name_data_mapper = project_name_data_mapper
      end

      def copy(template_file_path, destination_path)
        source_path = template_full_file_path(template_file_path)

        FileUtils.cp(source_path, "#{snakecased_name}#{destination_path}")
      end

      private

      attr_reader :project_name_data_mapper

      def snakecased_name
        project_name_data_mapper.snakecased
      end

      def template_full_file_path(template_relative_path)
        File.join(PicoApi.lib_path, template_relative_path)
      end
    end
  end
end
