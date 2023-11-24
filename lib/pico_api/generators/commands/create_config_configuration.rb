# frozen_string_literal: true

module PicoApi
  module Generators
    module Commands
      class CreateConfigConfiguration
        def self.call(project_name)
          file_creator = ::PicoApi::Generators::FileCreator.build(project_name)

          new(file_creator).call
        end

        def initialize(file_creator)
          @file_creator = file_creator
        end

        def call
          file_creator.create(template_file_path, destination_path)
        end

        private

        attr_reader :file_creator

        def template_file_path
          '/generators/templates/config/configuration.erb'
        end

        def destination_path
          '/config/configuration.rb'
        end
      end
    end
  end
end
