# frozen_string_literal: true

module PicoApi
  module Generators
    module Commands
      class CreateBase < Base
        def call
          create_bin_folder
          create_lib_folder
          create_config_folder
        end

        private

        def create_bin_folder
          FileUtils.mkdir_p("#{project_name_snakecased}/bin")
        end

        def create_lib_folder
          FileUtils.mkdir_p("#{project_name_snakecased}/lib/#{project_name_snakecased}")
        end

        def create_config_folder
          FileUtils.mkdir_p("#{project_name_snakecased}/config")
        end
      end
    end
  end
end
