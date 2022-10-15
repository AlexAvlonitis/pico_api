# frozen_string_literal: true

module PicoApi
  module Generators
    module Commands
      class CopyTemplate < Base
        def call
          copy_file
        end

        private

        def copy_file
          FileUtils.cp(template_full_path, "#{project_name_snakecased}#{destination_path}")
        end
      end
    end
  end
end
