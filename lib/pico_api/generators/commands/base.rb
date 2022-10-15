# frozen_string_literal: true

require 'fileutils'
require 'erb'

module PicoApi
  module Generators
    module Commands
      class Base
        def self.call(project_name)
          new(project_name).call
        end

        def initialize(project_name)
          @project_name_camelcased = project_name.camelize
          @project_name_snakecased = project_name.underscore
        end

        def call
          NotImplementError
        end

        def get_binding
          binding
        end

        private

        attr_reader :project_name_camelised, :project_name_snakecased

        def erb
          ERB.new(File.read(template_full_path))
        end

        def template_full_path
          File.join(PicoApi.lib_path, template_relative_path)
        end

        def template_relative_path
          ''
        end
      end
    end
  end
end
