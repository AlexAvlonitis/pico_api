# frozen_string_literal: true

module PicoApi
  module Generators
    module Commands
      class CreateConfigBoot < CopyTemplate
        private

        def destination_path
          '/config/boot.rb'
        end

        def template_relative_path
          '/generators/templates/config/boot.erb'
        end
      end
    end
  end
end
