# frozen_string_literal: true

module PicoApi
  module Generators
    module Commands
      class CreateConfigDatabaseYml < CopyTemplate
        private

        def destination_path
          '/config/database.yml'
        end

        def template_relative_path
          '/generators/templates/config/database.yml'
        end
      end
    end
  end
end
