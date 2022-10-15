# frozen_string_literal: true

module PicoApi
  module Generators
    module Commands
      class CreateConfigDotenv < CopyTemplate
        private

        def destination_path
          '/config/dotenv.rb'
        end

        def template_relative_path
          '/generators/templates/config/dotenv.erb'
        end
      end
    end
  end
end
