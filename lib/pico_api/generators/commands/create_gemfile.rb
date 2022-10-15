# frozen_string_literal: true

module PicoApi
  module Generators
    module Commands
      class CreateGemfile < CopyTemplate
        private

        def destination_path
          '/Gemfile'
        end

        def template_relative_path
          '/generators/templates/Gemfile.erb'
        end
      end
    end
  end
end
