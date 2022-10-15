# frozen_string_literal: true

module PicoApi
  module Generators
    module Commands
      class CreateRakefile < CopyTemplate
        private

        def destination_path
          '/Rakefile'
        end

        def template_relative_path
          '/generators/templates/Rakefile.erb'
        end
      end
    end
  end
end
