# frozen_string_literal: true

module PicoApi
  module Generators
    module Commands
      class CreateTemplate < Base
        def call
          create_file
        end

        private

        def create_file
          File.open("#{project_name_snakecased}#{destination_path}", 'w') do |f|
            f.write(erb.result(get_binding))
          end
        end
      end
    end
  end
end
