# frozen_string_literal: true

module PicoApi
  module Generators
    module Commands
      class CreateGitignore < CopyTemplate
        private

        def destination_path
          '/.gitignore'
        end

        def template_relative_path
          '/generators/templates/.gitignore'
        end
      end
    end
  end
end
