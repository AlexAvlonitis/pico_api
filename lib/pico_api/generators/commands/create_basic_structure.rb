# frozen_string_literal: true

require 'fileutils'

module PicoApi
  module Generators
    module Commands
      class CreateBasicStructure
        def self.call(project_name)
          project_name_data_mapper =
            ::PicoApi::Generators::ProjectNameDataMapper.new(project_name)

          new(project_name_data_mapper).call
        end

        def initialize(project_name_data_mapper)
          @project_name_data_mapper = project_name_data_mapper
        end

        def call
          create_bin_folder
          create_lib_folder
          create_config_folder
        end

        private

        attr_reader :project_name_data_mapper

        def create_bin_folder
          FileUtils.mkdir_p("#{snakecased_name}/bin")
        end

        def create_lib_folder
          FileUtils.mkdir_p("#{snakecased_name}/lib/#{snakecased_name}")
        end

        def create_config_folder
          FileUtils.mkdir_p("#{snakecased_name}/config")
        end

        def snakecased_name
          project_name_data_mapper.snakecased
        end
      end
    end
  end
end
