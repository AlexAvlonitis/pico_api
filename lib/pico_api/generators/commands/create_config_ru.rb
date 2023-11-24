# frozen_string_literal: true

module PicoApi
  module Generators
    module Commands
      class CreateConfigRu
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
          '/generators/templates/config.ru.erb'
        end

        def destination_path
          '/config.ru'
        end
      end
    end
  end
end
