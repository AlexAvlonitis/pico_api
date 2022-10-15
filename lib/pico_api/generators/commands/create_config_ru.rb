# frozen_string_literal: true

module PicoApi
  module Generators
    module Commands
      class CreateConfigRu < CreateTemplate
        private

        def destination_path
          '/config.ru'
        end

        def template_relative_path
          '/generators/templates/config.ru.erb'
        end
      end
    end
  end
end
