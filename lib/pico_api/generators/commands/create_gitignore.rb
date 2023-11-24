# frozen_string_literal: true

module PicoApi
  module Generators
    module Commands
      class CreateGitignore
        def self.call(project_name)
          file_copier = ::PicoApi::Generators::FileCopier.build(project_name)

          new(file_copier).call
        end

        def initialize(file_copier)
          @file_copier = file_copier
        end

        def call
          file_copier.copy(template_file_path, destination_path)
        end

        private

        attr_reader :file_copier

        def template_file_path
          '/generators/templates/.gitignore'
        end

        def destination_path
          '/.gitignore'
        end
      end
    end
  end
end
