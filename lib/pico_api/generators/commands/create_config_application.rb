# frozen_string_literal: true

module PicoApi
  module Generators
    module Commands
      class CreateConfigApplication < CreateTemplate
        private

        def destination_path
          '/config/application.rb'
        end

        def template_relative_path
          '/generators/templates/config/application.erb'
        end
      end
    end
  end
end
