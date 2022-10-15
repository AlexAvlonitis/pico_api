# frozen_string_literal: true

module PicoApi
  module Generators
    module Commands
      class CreateConfigDatabaseSetup < CopyTemplate
        private

        def destination_path
          '/config/database_setup.rb'
        end

        def template_relative_path
          '/generators/templates/config/database_setup.erb'
        end
      end
    end
  end
end
