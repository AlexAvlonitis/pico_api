# frozen_string_literal: true

module PicoApi
  module Generators
    module Commands
      class CreateConfigConfiguration < CreateTemplate
        private

        def destination_path
          '/config/configuration.rb'
        end

        def template_relative_path
          '/generators/templates/config/configuration.erb'
        end
      end
    end
  end
end
